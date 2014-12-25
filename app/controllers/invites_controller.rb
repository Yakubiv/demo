class InvitesController < ApplicationController
  def index
  	
  end

  def show
  	@users = User.paginate(page: params[:page], per_page: 12)
  	@header = 'Населення'
  end
end
