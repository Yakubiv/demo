class UsersController < ApplicationController
  
  def index
    @users = User.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
  end


  def search
  	@user = User.find_by_email(user_params)
  	redirect_to user_path(@user)
  end

  private
  
    def user_params
      params.require(:user).permit(:email, :username)
    end
end
