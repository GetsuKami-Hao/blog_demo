class SessionsController < ApplicationController
	def new

	end

	def create
		@user = User.find_by(email: params[:session][:email].downcase)

		if @user && @user.authenticate(params[:session][:password])
			render html: "登陆成功"
		else
			render html: "登陆失败"
		end
	end

end
