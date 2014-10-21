class DemoPageController < ApplicationController
  def index
  	respond_to do |format|
      format.json
      format.html          # /app/views/home/index.html.erb
      format.html.phone    # /app/views/home/index.html+phone.erb
    end
  end
  def show
  end
end
