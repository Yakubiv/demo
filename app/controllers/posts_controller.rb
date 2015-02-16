class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :destroy]

  def index
    if params[:search]
      @posts = Post.search(params[:search]).paginate(page: params[:page], per_page: 8)
    else
      @posts = Post.paginate(page: params[:page], per_page: 6)
    end
    @user = User.find_by_email(params[:id])
    @recent_posts = Post.order("created_at desc").limit(10).offset(0)
    if user_signed_in?
      @recent_user_post = current_user.posts.order("created_at desc").limit(4).offset(0)
    end
    @tags = Post.tag_counts_on(:tags)
  end

  def new
    @post = Post.new
    @user = User.find_by_email(params[:id])
    @recent_posts = Post.order("created_at desc").limit(10).offset(0)
    if user_signed_in?
      @recent_user_post = current_user.posts.order("created_at desc").limit(4).offset(0)
    end
  end

  def edit
    @recent_posts = Post.order("created_at desc").limit(10).offset(0)

  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def create
    @user = User.find_by_email(params[:id])
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render 'new'
    end
  end

  def update
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post.destroy
    redirect_to posts_path(@posts)
  end

private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit!
  end
end
