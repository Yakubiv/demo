class UsersController < ApplicationController
  
  def new
    
  end

  def index
    @users = User.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
    @tags = Post.tag_counts_on(:tags)
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to :back, notice: 'Аватар змінено'
  end

  def following
    @title = "Following"
    @header = 'Following'
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @header = 'Followers'
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end


  def search
  	@user = User.find_by_email(user_params)
  	redirect_to user_path(@user)
  end

  private
  
    def user_params
      params.require(:user).permit(:email, :username, :avatar)
    end
end
