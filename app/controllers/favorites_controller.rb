class FavoritesController < ApplicationController
  	def create
		current_user.favorites.create(user_id: params[:user_id], post_id: params[:post_id])
		render :nothing => true
	end

	def index
		@user = User.find_by_email(params[:user_id])
	end

	def destroy
		@favorite = Favorite.find_by_post_id(params[:post_id])
    	@favorite.destroy
    	render :nothing => true
	end
end
