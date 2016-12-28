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

  private
  	def create_user_params
  		params.require(:user).permit(:name,:email,:password,:password_confirmation)
  	end
end
