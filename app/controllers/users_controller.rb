class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(create_user_params)

  	if @user.save
  		redirect_to @user
  		flash[:success] = "注册成功"
  		
  	else
  		render html: "注册失败"
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

  private
  	def create_user_params
  		params.require(:user).permit(:name,:email,:password,:password_confirmation)
  	end

    def user_avatar
      params.require(:user).permit(:avatar)
    end
end
