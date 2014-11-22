class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end

	def create
		@user = User.find(params[:user_id])
	    @post = @user.posts.find(params[:post_id])
	    @comment = @post.comments.create(comment_params)
	    @comment.user_id = current_user.id
	    if @comment.save
	  		redirect_to user_post_path(@post)
	  	end
	end

private
	def comment_params
		params.require(:comment).permit(:content, :user_id, :post_id)
	end

end
