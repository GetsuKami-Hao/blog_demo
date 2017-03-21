class LikesController < ApplicationController
  before_action :log_in_user

  def create
    article = Article.find(params[:article_id])
    current_user.like_article(article)
    redirect_to article
  end

  def destroy	
    article = Like.find(params[:id]).liked_article
    current_user.unlike_article	(article)

    redirect_to article
  end
end
