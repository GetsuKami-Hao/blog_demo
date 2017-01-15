module SessionsHelper

	def store_search_str(str)
		session[:store_serach_str] = str
	end

	def get_search_str
		session[:store_serach_str]
	end

	#登陆当前用户
	def log_in(user)
		session[:user_id] = user.id
	end
	
	#返回当前用户
	def current_user
		@current_user ||=  User.find_by(id: session[:user_id])
	end

	
	# 判断当前用户是否登陆
	def logged_in?
		!current_user.nil?
	end

	#用户退出
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

end
