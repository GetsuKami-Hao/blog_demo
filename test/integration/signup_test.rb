require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest

	test "invalid signup information" do 
		get signup_path
	end

end
