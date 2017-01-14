module SessionsHelper

	#记录查找用户
	def get_find_users
		session[:users]
	end

	#存储查找用户
	def store_find_users(users)
		session[:users] = users
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
