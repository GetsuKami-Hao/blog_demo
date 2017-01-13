require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest

	def setup
		@user = users(:login_user)
	end

	test "error user login information" do 
		get login_path
		assert_response :success

		post login_path ,params: { session: { email: "1234@qq.com", password: "12345" } }

		assert_template 'sessions/new'
		assert_not flash.empty?
		get root_path
		assert flash.empty?
	end

	test "login success" do
		get login_path

		post login_path ,params: {session: 
													{ email: @user.email, password: 'password'} }
													
		assert_redirected_to @user
		follow_redirect! 
		assert_template 'users/show'
	end
end
