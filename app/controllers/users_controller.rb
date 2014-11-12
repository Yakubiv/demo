class UsersController < ApplicationController
  def show
    @user = User.find_by_email(params[:id])
  end

  def search
  	@user = User.find_by_email(user_params)
  	redirect_to user_path(@user)
  end

  private
    def user_params
      params.require(:user).permit(:email)
    end
end
