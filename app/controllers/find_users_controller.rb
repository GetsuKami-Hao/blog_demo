class FindUsersController < ApplicationController
	def search_users
		# @user = User.find_by(name: params[:user][:name])
		
		if params[:user][:name].nil?
			store_search_str(nil)
		elsif params[:user][:name].length <= 0
			store_search_str(nil)
		else
			store_search_str(params[:user][:name])
		end

		redirect_to find_show_users_url
	end

	def show
		str = get_search_str
		if str.nil?
			flash[:danger] = "查询不可为空"
			redirect_to root_url
		else
			@find_users = User.where("name like ?" , "%#{str}%").paginate(page: params[:page], 
																																per_page: 10)

		end

	end
end
