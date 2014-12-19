class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: 6)
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
    @post = Post.find(params[:id])
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
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path(@posts)
  end

  private


    def post_params
      params.require(:post).permit(:user_id, :title, :content, :tag_list)
    end
end
