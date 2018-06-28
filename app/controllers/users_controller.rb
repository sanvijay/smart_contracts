class UsersController < ApplicationController
  before_action :set_user, only: [:show, :check_valid_diagnosis]

  def show; end

  def new
    @user = User.new
  end

  def check_valid_diagnosis
    valid = @smart_contract.eligible_for_diagnosis_code?(params[:user_insurance][:illness])

    respond_to do |format|
      format.json { render json: { valid: valid } }
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
end
