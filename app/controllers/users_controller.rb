class UsersController < ApplicationController
  before_action :set_user, only: [:show, :check_valid_diagnosis]

  def show; end

  def new
    @user = User.new
  end

  def check_valid_diagnosis
    @p_code = params[:user_insurance][:illness]
    valid = @smart_contract.eligible_for_diagnosis_code?(@p_code)

    @eligible_codes = @smart_contract.eligible_for_diagnosis_code

    @valid_message = valid ? valid_additional_info : 'Sorry! You are not eligible for the treatment'

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

    def valid_additional_info
      doctors = @eligible_codes[@p_code.to_sym][:doctors]
      copay = @eligible_codes[@p_code.to_sym][:copay]

      html = "<ul>"
      html << "<li>Doctors: #{doctors}</li>"
      html << "<li>Copay: #{copay}</li>"
      html << "</ul>"
      html.html_safe
    end
end
