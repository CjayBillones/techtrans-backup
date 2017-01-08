require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin_user = users(:admin)
    @other_user = users(:academe_one)
    @article = articles(:article_1)
  end

  test "should redirect new when not logged in" do
    get new_article_path
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect new when not admin" do
    log_in_as(@other_user)
    get new_article_path
    assert_not flash.empty?
    assert_redirected_to root_path
  end

  test "should get new when logged in as admin" do
    log_in_as(@admin_user)
    get new_article_path
    assert_response :success
  end

  test "should redirect create when not logged in" do
    post articles_path(@new_article), params: { article: {
                                                  title:   "Lorem Ipsum",
                                                  content: "Lorem Ipsum"
                                      }}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect create when not logged in as admin" do
    log_in_as(@other_user)
    assert_no_difference 'Article.count' do
      post articles_path(@new_article), params: { article: {
                                                    title:   "Lorem Ipsum",
                                                    content: "Lorem Ipsum"
                                        }}
    end
    assert_not flash.empty?
    assert_redirected_to root_path
  end

  test "should create article when logged in as admin" do
    log_in_as(@admin_user)
    assert_difference 'Article.count', +1 do
      post articles_path(@new_article), params: { article: {
                                                    title:   "Lorem Ipsum",
                                                    content: "Lorem Ipsum"
                                        }}
    end
    assert_not flash.empty?
    assert_redirected_to @new_article_path     
  end

  test "should redirect edit when not logged in" do
    get edit_article_path(@article)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in as admin" do
    log_in_as(@other_user)
    get edit_article_path(@article)
    assert_not flash.empty?
    assert_redirected_to root_path
  end

  test "should get edit when logged in as admin" do
    log_in_as(@admin_user)
    get edit_article_path(@article)
    assert_response :success
  end

  test "should redirect update when not logged in" do
    patch article_path(@article), params: { article: {
                                                  title:   "Lorem Ipsum",
                                                  content: "Lorem Ipsum"
                                          }}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in as admin" do
    log_in_as(@other_user)
    patch article_path(@article), params: { article: {
                                                  title:   "Lorem Ipsum",
                                                  content: "Lorem Ipsum"
                                          }}
    assert_not flash.empty?
    assert_redirected_to root_path    
  end

  test "should update article when logged in as admin" do
    log_in_as(@admin_user)
    patch article_path(@article), params: { article: {
                                                  title: "New title",
                                                  content: "New content"
                                          }}
    assert_not_equal "New title", @article.title
    assert_response :success
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Article.count' do
      delete article_path(@article)
    end
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'Article.count' do
      delete article_path(@article)
    end
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test "should destroy articles when logged in as admin" do
    log_in_as(@admin_user)
    assert_difference 'Article.count', -1 do
      delete article_path(@article)
    end
    assert_not flash.empty?
    assert_redirected_to articles_path
  end

end
