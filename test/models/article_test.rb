require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  def setup
    @user = users(:cjay)
    @article = @user.articles.build(title:"Lorem Ipsum", content:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce nec tellus eu diam elementum laoreet. Morbi mauris erat, eleifend ut maximus eu, imperdiet eget nunc.")
  end

  test "should be valid" do
    assert @article.valid?
  end

  test "user_id should be present" do
    @article.user_id = nil
    assert_not @article.valid?
  end

  test "title should be present" do
    @article.title = " "
    assert_not @article.valid?
  end

  test "title should be at most 255 characters" do
    @article.title = "a" *256
    assert_not @article.valid?
  end

  test "content should be present" do
    @article.content = " "
    assert_not @article.valid?
  end

  test "order should be most recent first" do
    assert_equal articles(:most_recent), Article.first
  end

end
