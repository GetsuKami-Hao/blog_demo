require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  def setup
    @article = users(:login_user).articles.new(title: "title", content: "content")
  end

  test "title must presence" do
    @article.title = "\n"

    assert_not @article.valid?
  end

  test "user id must presence" do
    @article.user_id = "\n"

    assert_not @article.valid?
  end

  test "title max length less 255" do
    @article.title = '*' * 256
    assert_not @article.save
  end
end
