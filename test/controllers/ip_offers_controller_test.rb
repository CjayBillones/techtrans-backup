require 'test_helper'

class IpOffersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user       = users(:admin)
    @other_user = users(:academe_one)
    @ip_offer = ip_offers(:offer_one)
  end

  test "should get index" do
    get ip_offers_path
    assert_response :success
  end

  test "should get show" do
    get ip_offer_path(@ip_offer)
    assert_response :success
  end

  test "should redirect new when not logged in" do
    get new_ip_offer_path
    assert_redirected_to login_path
  end

  test "should get new when user is logged in" do
    log_in_as(@user)
    get new_ip_offer_path
    assert_response :success
  end

  test "should redirect create when not logged in" do
    post ip_offers_path, params: { ip_offer: {
                                            title:       "Lorem Ipsum",
                                            overview: "Lorem Ipsum"
                                        }}
    assert_redirected_to login_path
  end

  test "should create IP offer when user is logged in" do
    log_in_as(@user)
    post ip_offers_path, params: { ip_offer: {
                                            title:       "Lorem Ipsume",
                                            overview: "Lorem Ipsum",
                                        }}
    assert_redirected_to @user.ip_offers.first    
  end

  test "should redirect edit when not logged in" do
    get edit_ip_offer_path(@ip_offer)
    assert_redirected_to login_path
  end

  test "should redirect edit when wrong user is logged in" do
    log_in_as(@other_user)
    get edit_ip_offer_path(@ip_offer)
    assert_redirected_to root_path
  end

  test "should get edit when correct user is logged in" do
    log_in_as(@user)
    get edit_ip_offer_path(@ip_offer)
    assert_response :success
  end

  test "should redirect update when not logged in" do
    patch ip_offer_path(@ip_offer), params: { ip_offer: {
                                                title:       "Lorem Ipsum",
                                                overview: "Lorem Ipsum"
                                            }}
    assert_redirected_to login_path
  end

  test "should redirect update when wrong user is logged in" do
    log_in_as(@other_user)
    patch ip_offer_path(@ip_offer), params: { ip_offer: {
                                            title:       "Lorem Ipsum",
                                            overview: "Lorem Ipsum"
                                        }}
    assert_redirected_to root_path
  end

  test "should update when correct user is logged in" do
    log_in_as(@user)
    patch ip_offer_path(@ip_offer), params: { ip_offer: {
                                                title:       "Lorem Ipsum",
                                                overview: "Lorem Ipsum"
                                            }}
    assert_redirected_to @ip_offer
  end

  test "should redirect destroy if not logged in" do
    assert_no_difference 'IpOffer.count' do
      delete ip_offer_path(@ip_offer)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when wrong user is logged in" do
    log_in_as(@other_user)
    assert_no_difference 'IpOffer.count' do
      delete ip_offer_path(@ip_offer)
    end
    assert_redirected_to root_path
  end

  test "should destroy when correct user is logged in" do
    log_in_as(@user)
    assert_difference 'IpOffer.count', -1 do
      delete ip_offer_path(@ip_offer)
    end
    assert_redirected_to ip_offers_path
  end

end
