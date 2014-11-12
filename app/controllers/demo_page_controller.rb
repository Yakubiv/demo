class DemoPageController < ApplicationController
  def index
  	@posts = Post.paginate(page: params[:page], per_page: 6)
  	respond_to do |format|
      format.json
      format.html          # /app/views/home/index.html.erb
      format.html.phone    # /app/views/home/index.html+phone.erb
    end
  end

end
