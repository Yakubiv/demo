class DemoPageController < ApplicationController
  
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


  def index
    @posts = Post.paginate(page: params[:page], per_page: 6)
    @user = User.find_by_email(params[:id])
    @tags = Post.tag_counts_on(:tags)
    if user_signed_in?
      @recent_user_post = current_user.posts.order("created_at desc").limit(4).offset(0)
    end
  	@recent_posts = Post.order("created_at desc").limit(5).offset(0)
  	respond_to do |format|
      format.json
      format.html          # /app/views/home/index.html.erb
      format.html.phone    # /app/views/home/index.html+phone.erb
    end
  end

end
