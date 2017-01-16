require 'test_helper'

class FindUsersTest < ActionDispatch::IntegrationTest

	def setup
		
	end

	test "search invalid information" do 
		get root_path
		post find_show_user_path, params: { user: { name: "" } }
		follow_redirect! 
		assert_redirected_to root_url
		assert_not flash.empty?
	end

	test "search valid information" do
		get root_path
		post find_show_user_path, params: { user: { name: "ka" } }
		assert flash.empty?
	end
end
