class PostsController < ApplicationController


	def index



	end

	def new

		@post = Post.new
		@post.comments.build #why is this the solution?

	end

	def create

		binding.pry

	end



end
