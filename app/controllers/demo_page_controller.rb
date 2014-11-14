class DemoPageController < ApplicationController
  def index
  	@recent_posts = Post.order("created_at desc").limit(10).offset(0)
    if user_signed_in?
      @recent_user_post = current_user.posts.order("created_at desc").limit(4).offset(0)
    end
  	@posts = Post.paginate(page: params[:page], per_page: 6)
  	respond_to do |format|
      format.json
      format.html          # /app/views/home/index.html.erb
      format.html.phone    # /app/views/home/index.html+phone.erb
    end
  end

end
