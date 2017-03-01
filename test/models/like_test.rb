require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  
  def setup
    @user = User.create(name:"kaka",email: "kaka@kaka.com",
                          password_digest: User.digest('password'))
    @article = @user.articles.create(title: "mysq",content: "kakarot")
  	@like = Like.new(liker_id: @user.id, liked_article_id: @article.id)
  end

  test "user like article and only once" do
    Like.destroy_all
    assert @like.valid?
    assert @like.valid? 
    assert @like.save
    @other = @like.dup
    assert_not @other.save
  end

  test "liker-id must presence" do
    @like.liker_id = ""
    assert_not @like.valid?
  end
end
