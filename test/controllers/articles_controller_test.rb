require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user       = users(:cjay)
    @other_user = users(:dyosa)
    @article = articles(:orange)
  end

  test "should redirect new when not logged in" do
    get new_article_path
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect create when not logged in" do
    post articles_path(@new_article), params: { article: {
                                                  title:   "Lorem Ipsum",
                                                  content: "Lorem Ipsum"
                                      }}
  end

  test "should redirect edit when not logged in" do
    get edit_article_path(@article)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch article_path(@article), params: { article: {
                                                  title:   "Lorem Ipsum",
                                                  content: "Lorem Ipsum"
                                          }}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Article.count' do
      delete article_path(@article)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'Article.count' do
      delete article_path(@article)
    end
    assert_redirected_to root_url
  end

end
