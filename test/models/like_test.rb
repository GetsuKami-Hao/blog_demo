require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  
  def setup
  	@like = Like.new(liker_id: users(:liker), 
  									liked_article_id: articles(:liked_article))
  end
  test "liker-id and liked-article-id unique" do
  	assert_not @like.valid?
  	assert_not @like.save
  	@other = @like.dup
  	assert_not @other.save
	end
end
