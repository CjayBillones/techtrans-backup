require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user_cjay = users(:cjay)
    @user_dyosa = users(:dyosa)
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_path
  end

  test "unsuccessful edit" do
    log_in_as(@user_cjay)
    get edit_user_path(@user_cjay)
    assert_template 'users/edit'
    patch user_path(@user_cjay), params: { user: { name:  "",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar" } }
    assert_template 'users/edit'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end  

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user_cjay)
    log_in_as(@user_cjay)
    assert_redirected_to edit_user_path(@user_cjay)
    first_name  = "Foo"
    last_name = "Bar"
    email = "foo@bar.com"
    patch user_path(@user_cjay), params: { user: { first_name:  first_name,
                                              last_name: last_name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user_cjay
    @user_cjay.reload
    assert_equal first_name,  @user_cjay.first_name
    assert_equal last_name, @user_cjay.last_name
    assert_equal email, @user_cjay.email
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user_cjay)
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "should redirect update when not logged in" do
    patch user_path(@user_cjay), params: { user: { first_name: @user_cjay.first_name,
                                              last_name: @user_cjay.last_name,
                                              email: @user_cjay.email } }
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@user_dyosa)
    get edit_user_path(@user_cjay)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@user_dyosa)
    patch user_path(@user_cjay), params: { user: { first_name: @user_cjay.first_name,
                                              last_name: @user_cjay.last_name,
                                              email: @user_cjay.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end

end
