class TagsController < ApplicationController

	def index
		@tags = Post.tag_counts_on(:tags)
		@posts = Post.tagged_with(@tag)
	end

	def show
		@tag = ActsAsTaggableOn::Tag.find_by name: params[:id]
		@posts = Post.tagged_with(@tag).all
	end
end