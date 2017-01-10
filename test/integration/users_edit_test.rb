require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user_cjay = users(:admin)
    @user_dyosa = users(:academe_one)
  end

  test "unsuccessful edit" do
    log_in_as(@user_cjay)
    get edit_user_path(@user_cjay)
    assert_template 'users/edit'
    patch user_path(@user_cjay), params: { user: { 
                                              first_name: "  ",
                                              last_name: "Billones",
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
    first_name = "Foo"
    last_name = "Bar"
    email = "foo@bar.com"
    patch user_path(@user_cjay), params: { user: {
                                              first_name: first_name,
                                              last_name: last_name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user_cjay
    @user_cjay.reload
    assert_equal first_name, @user_cjay.first_name
    assert_equal last_name, @user_cjay.last_name
    assert_equal email, @user_cjay.email
  end

end
