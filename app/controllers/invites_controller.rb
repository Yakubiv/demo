class InvitesController < ApplicationController
  def index
  	
  end

  def show
  	@users = User.order(created_at: :desc)
  end
end
