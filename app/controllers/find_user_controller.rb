class FindUserController < ApplicationController
	def show
		# @user = User.find_by(name: params[:user][:name])
		begin
			@users = User.where("name like ?" , "%#{params[:user][:name]}%")
			if @users
				# redirect_to @user 
			else
				flash[:danger] = "用户未找到"
				redirect_to root_url
			# rescue 

			end
		end
	end
end
