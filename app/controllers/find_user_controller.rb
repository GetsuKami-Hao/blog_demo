class FindUserController < ApplicationController
	def show
		@user = User.find_by(name: params[:user][:name])
		if @user
			redirect_to @user 
		else
			flash[:danger] = "用户未找到"
			redirect_to root_url
		end
	end
end
