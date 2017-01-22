class CommentsController < ApplicationController

	def new
		@comment = current_user.comments.build
	end

	def create
		@article = Article.find(params[:article_id])
		@comment = current_user.comments.build(article_id: @article.id ,
																				content: params[:comment][:content])

		if @comment.save
			flash[:success] = 'add comment success.'
			redirect_to @article
		else
      flash[:danger] = 'add comment fail.'
  		render 'new'
  	end
	end

end
