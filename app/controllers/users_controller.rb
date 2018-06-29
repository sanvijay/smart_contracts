class UsersController < ApplicationController
  before_action :set_user, only: [:show, :check_valid_diagnosis]

  def show; end

  def insurance_plan
    @user = User.find(5)
    @smart_contract = @user.smart_contract.camelcase.constantize
  end

  def new
    @user = User.new
  end

  def check_valid_diagnosis
    p_code = params[:user_insurance][:illness]
    valid = @smart_contract.eligible_for_diagnosis_code?(p_code)

    @eligible_codes = @smart_contract.eligible_for_diagnosis_code

    @valid_message = valid ? valid_additional_info(valid) : 'Sorry! You are not eligible for the treatment'

    respond_to do |format|
      format.js
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Smart Contract!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      @smart_contract = @user.smart_contract.camelcase.constantize
    end

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :smart_contract)
    end

    def valid_additional_info(code)
      code = code.to_sym
      doctors = @eligible_codes[code][:doctors]
      copay = @eligible_codes[code][:copay]

      html = "<ul>"
      html << "<li>Currently there are #{doctors.count} providers in your area who accept this insurance</li>"
      html << "<li>Expected co-pay is #{copay}%</li>"
      html << "</ul>"
      html.html_safe
    end
end
