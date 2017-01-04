class ArticlesController < ApplicationController
  def new
  	@article = current_user.articles.build
  end

  def create
  	@article = current_user.articles.build(article_params)
  	if @article.save
  		flash.now[:success] = "发布成功。"
  		redirect_to @article
  	else
  		render html: "失败"
  	end
  end

  def show
  	@article = Article.find(params[:id])
  end

  def destroy
  	if Article.find(params[:id]).destroy
  		flash[:success] = "deleted success."
  		render html: "ok"
  	end
  end

  def index
  	@user = current_user

  	@articles = @user.articles.paginate(page: params[:page])
  end

  private
  	def article_params
  		params.require(:article).permit(:title,:content)
  	end
end
