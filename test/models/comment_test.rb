require 'test_helper'

class CommentTest < ActiveSupport::TestCase

	def setup
		@comment = articles(:login_user).comments.new(
									user_id: users(:login_user).id ,content: "kakarot")
	end

	test "user_id is presence" do 
		@comment.user_id = ""
		assert_not @comment.valid?
	end

	test "article_id is presence" do
		@comment.article_id = ""
		assert_not @comment.valid?
	end

end
