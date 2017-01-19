class UsersController < ApplicationController
  before_action :log_in_user , only: [:update,:edit]
  def show
  	@user = User.find(params[:id])
    
    @articles = @user.articles.paginate(page: params[:page], per_page: 10)
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(create_user_params)

  	if @user.save
      flash[:success] = "注册成功"
      log_in @user
  		redirect_to @user
  	else
      flash.now[:danger] = "注册失败"
  		render 'new'
  	end
 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find_by(email: current_user[:email])
    if @user.update_attributes(user_avatar)
      redirect_to @user
    else
      render html: "failure"
    end
  end

  def articles
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page])
    render 'show_articles'
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_following'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_followers'
  end

  def find_users
    if params[:user][:name].nil? || params[:user][:name].length <= 0
      flash[:danger] = "查询不可为空"
      redirect_to root_url
    else
      str = params[:user][:name]
      @users = User.where("name like ?" , "%#{str}%").paginate(
                                              page: params[:page], per_page: 10)

      render 'show_find_users'
    end
  end

  private
  	def create_user_params 
  		params.require(:user).permit(:name,:email,:password,:password_confirmation)
  	end

    def user_avatar
      params.require(:user).permit(:name, :avatar)
    end
end
