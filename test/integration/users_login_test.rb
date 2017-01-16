require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin_user = users(:admin)
    @inactive_user = users(:inactive)
    @unapproved_user = users(:unapproved)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email_or_username: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login inactive user" do
    get login_path
    post login_path, params: { session: {email_or_username: @inactive_user.email, password: 'password'}}
    assert_not is_logged_in?
    assert_not flash.empty?
    @inactive_user.update!(activated: true, activated_at: Time.zone.now)
    post login_path, params: { session: {email_or_username: @inactive_user.email, password: 'password'}}
    assert is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href=?]", login_path, count: 0
    #assert_select "a[href=?]", logout_path
    #assert_select "a[href=?]", user_path(@inactive_user)
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@inactive_user), count: 0
  end

  test "login unapproved user" do
    get login_path
    post login_path, params: { session: {email_or_username: @unapproved_user.email, password: 'password'}}
    assert_not is_logged_in?
    assert_not flash.empty?
    @unapproved_user.update!(approval_status: 'approved')
    post login_path, params: { session: {email_or_username: @unapproved_user.email, password: 'password'}}
    assert is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href=?]", login_path, count: 0
    #assert_select "a[href=?]", logout_path
    #assert_select "a[href=?]", user_path(@unapproved_user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    # Simulate a user clicking logout in a second window.
    delete logout_path    
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@unapproved_user), count: 0        
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email_or_username: @admin_user.email, password: 'password' } }
    assert is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href=?]", login_path, count: 0
    #assert_select "a[href=?]", logout_path
    #assert_select "a[href=?]", user_path(@admin_user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    # Simulate a user clicking logout in a second window.
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@admin_user), count: 0  
  end

  test "login with valid username and password followed by logout" do
    get login_path
    post login_path, params: { session: { email_or_username: @admin_user.username, password: 'password' } }
    assert is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href=?]", login_path, count: 0
    #assert_select "a[href=?]", logout_path
    #assert_select "a[href=?]", user_path(@admin_user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    # Simulate a user clicking logout in a second window.
    delete logout_path    
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@admin_user), count: 0  
  end

  test "login with remembering" do
    log_in_as(@admin_user, remember_me: '1')
    assert_not_nil cookies['remember_token']
  end

  test "login without remembering" do
    log_in_as(@admin_user, remember_me: '0')
    assert_nil cookies['remember_token']
  end

end
