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
      flash.now[:danger] = "发布失败。"
  		render 'new'
  	end
  end

  def show
  	@article = Article.find(params[:id])
  end

  def destroy
  	if Article.find(params[:id]).destroy
  		flash[:success] = "deleted success."
  		redirect_to articles_url
  	end
  end

  def index
  	@user = current_user

  	@articles = @user.articles.paginate(page: params[:page], per_page: 10)
  end

  private
  	def article_params
  		params.require(:article).permit(:title,:content)
  	end
end
