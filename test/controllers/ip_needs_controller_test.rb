require 'test_helper'

class IpNeedsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @admin_user = users(:admin)
    @academe_user = users(:academe_one)
    @industry_user = users(:industry_one)
    @ip_need = ip_needs(:need_two)
  end

  test "should get index" do
    get ip_needs_path
    assert_response :success
  end

  test "should get show" do
    get ip_need_path(@ip_need)
    assert_response :success
  end

  test "should redirect new when not logged in" do
    get new_ip_need_path
    assert_redirected_to login_path
  end

  test "should get new when user is logged in" do
    log_in_as(@academe_user)
    get new_ip_need_path
    assert_response :success
  end

  test "should redirect create when not logged in" do
    post ip_needs_path, params: { ip_need: {
                                            title:       "Lorem Ipsum",
                                            description: "Lorem Ipsum"
                                        }}
    assert_redirected_to login_path
  end

  test "should create IP need when user is logged in" do
    log_in_as(@academe_user)
    post ip_needs_path, params: { ip_need: {
                                            title:       "Lorem Ipsume",
                                            description: "Lorem Ipsum",
                                        }}
    assert_redirected_to @academe_user.ip_needs.first    
  end

  test "should redirect edit when not logged in" do
    get edit_ip_need_path(@ip_need)
    assert_redirected_to login_path
  end

  test "should redirect edit when wrong user is logged in" do
    log_in_as(@industry_user)
    get edit_ip_need_path(@ip_need)
    assert_redirected_to root_path
  end

  test "should get edit when correct user is logged in" do
    log_in_as(@academe_user)
    get edit_ip_need_path(@ip_need)
    assert_response :success
  end

  test "should redirect update when not logged in" do
    patch ip_need_path(@ip_need), params: { ip_need: {
                                                title:       "Lorem Ipsum",
                                                description: "Lorem Ipsum"
                                            }}
    assert_redirected_to login_path
  end

  test "should redirect update when wrong user is logged in" do
    log_in_as(@industry_user)
    patch ip_need_path(@ip_need), params: { ip_need: {
                                            title:       "Lorem Ipsum",
                                            description: "Lorem Ipsum"
                                        }}
    assert_redirected_to root_path
  end

  test "should update when correct user is logged in" do
    log_in_as(@academe_user)
    patch ip_need_path(@ip_need), params: { ip_need: {
                                                title:       "Lorem Ipsum",
                                                description: "Lorem Ipsum"
                                            }}
    assert_redirected_to @ip_need
  end

  test "should redirect destroy if not logged in" do
    assert_no_difference 'IpNeed.count' do
      delete ip_need_path(@ip_need)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when wrong user is logged in" do
    log_in_as(@industry_user)
    assert_no_difference 'IpNeed.count' do
      delete ip_need_path(@ip_need)
    end
    assert_redirected_to root_path
  end

  test "should destroy when correct user is logged in" do
    log_in_as(@academe_user)
    assert_difference 'IpNeed.count', -1 do
      delete ip_need_path(@ip_need)
    end
    assert_redirected_to ip_needs_path
  end


end
