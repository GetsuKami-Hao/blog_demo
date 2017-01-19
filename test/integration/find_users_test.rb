require 'test_helper'

class FindUsersTest < ActionDispatch::IntegrationTest

	test "search information can't empty" do 
		get root_path
		post find_users_path, params: { user: { name: "" } }
		assert_not flash.empty?
		assert_redirected_to root_url
	end
end
