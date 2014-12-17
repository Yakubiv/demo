class CommentsController < ApplicationController
	before_filter :authenticate_user!


	def new
		@comment = Comment.new
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def create
		@user = User.find(params[:user_id])
		@post = Post.find(params[:post_id])
	    @comment = @post.comments.build(comment_params)
	    @comment.user_id = current_user.id
	    if @comment.save
			flash[:notice] = "Comment has been created."
			redirect_to user_post_path(@user, @post)
		else
			redirect_to user_post_path(@user, @post)
			flash[:alert] = "Comment has not been created."

		end
	end

private
	def comment_params
		params.require(:comment).permit(:content, :user_id, :post_id)
	end

end
