class ArticlesController < ApplicationController
  before_action :log_in_user
  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash.now[:success] = '发布成功。'
  	  redirect_to @article
    else
      flash.now[:danger] = '发布失败。'
  	  render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:success] = "update success."
      redirect_to @article
    else
      render html: 'failure'
    end
  end

  def show
    @article = Article.find(params[:id])
    @user = @article.user
    @comments = @article.comments  
  end

  def destroy
    if Article.find(params[:id]).destroy
  	  flash[:success] = 'deleted success.'
  	  redirect_to articles_url
    end
  end

  def index
    @articles = Article.all.paginate(page: params[:page], per_page: 10)
  end

  def find_articles
    if params[:article][:title].nil? || params[:article][:title].length <= 0
      flash[:danger] = 'search information can\'t is empty '
      redirect_to root_url
    else
      str = params[:article][:title]
      store_search_str(str)
      redirect_to show_find_articles_url
    end
  end

  def show_find_articles
    str = get_search_str
    @articles = Article.where("title like ?" , "%#{str}%").paginate(
                                              page: params[:page], per_page: 10)
      
  end

  private
    def article_params
  	  params.require(:article).permit(:title,:content)
    end
end
