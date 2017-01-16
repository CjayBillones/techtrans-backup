require 'test_helper'

class IpShowLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin_user = users(:admin)
    @academe_user = users(:academe_one)
    @industry_user = users(:industry_one)
    @academe_user_offer = ip_offers(:offer_two)
    @academe_user_need = ip_needs(:need_two)
    @other_offer = ip_offers(:offer_one)
    @industry_user_need = ip_needs(:need_three)
    @other_need = ip_needs(:need_one)
  end

  test "industry_user should not see submit new offer button" do
    log_in_as(@industry_user)
    assert is_logged_in?
    get ip_offer_path(@academe_user_offer)
    assert_template "ip_offers/show"
    assert_dom_equal "/ip_offers/#{@academe_user_offer.id}", ip_offer_path(@academe_user_offer)
    assert_select 'input' do |btn|
      btn.each do |s|
        assert_no_match 'Submit New Offer', btn.to_s
      end
    end
  end

  test "unsigned in user should not see subscribe, unsubsctibe, edit, delete, download, submit offer buttons on offer" do
    get ip_offer_path(@academe_user_offer)
    assert_template "ip_offers/show"
    assert_dom_equal "/ip_offers/#{@academe_user_offer.id}", ip_offer_path(@academe_user_offer)
    assert_select 'input' do |btn|
      btn.each do |s|
        assert_no_match 'Submit New Offer', btn.to_s
        assert_no_match 'Subscribe', btn.to_s
        assert_no_match 'Unsubscribe', btn.to_s
        assert_no_match 'Download PDF Copy', btn.to_s
        assert_no_match 'Edit', btn.to_s
        assert_no_match 'Delete', btn.to_s
      end
    end
  end

  test "unsigned in user should not see subscribe, unsubsctibe, edit, delete, download, submit offer buttons on need" do
    get ip_need_path(@academe_user_need)
    assert_template "ip_needs/show"
    assert_dom_equal "/ip_needs/#{@academe_user_need.id}", ip_need_path(@academe_user_need)
    assert_select 'input' do |btn|
      btn.each do |s|
        assert_no_match 'Submit New Offer', btn.to_s
        assert_no_match 'Subscribe', btn.to_s
        assert_no_match 'Unsubscribe', btn.to_s
        assert_no_match 'Download PDF Copy', btn.to_s
        assert_no_match 'Edit', btn.to_s
        assert_no_match 'Delete', btn.to_s
      end
    end
  end

  test "academe user should not see subscribe button on its own offer" do
    log_in_as(@academe_user)
    assert is_logged_in?
    get ip_offer_path(@academe_user_offer)
    assert_template "ip_offers/show"
    assert_dom_equal "/ip_offers/#{@academe_user_offer.id}", ip_offer_path(@academe_user_offer)
    assert_select 'input' do |btn|
      btn.each do |s|
        assert_no_match 'Subscribe', btn.to_s
      end
    end
  end

  test "academe user should not see unsubscribe button on its own offer" do
    log_in_as(@academe_user)
    assert is_logged_in?
    get ip_offer_path(@academe_user_offer)
    assert_template "ip_offers/show"
    assert_dom_equal "/ip_offers/#{@academe_user_offer.id}", ip_offer_path(@academe_user_offer)
    @academe_user.follow(@academe_user_offer)
    get ip_offer_path(@academe_user_offer)
    assert_select 'input' do |btn|
      btn.each do |s|
        assert_no_match 'Unsubscribe', btn.to_s
      end
    end
  end

  test "academe user should not see subscribe button on its own need" do
    log_in_as(@academe_user)
    assert is_logged_in?
    get ip_need_path(@academe_user_need)
    assert_template "ip_needs/show"
    assert_dom_equal "/ip_needs/#{@academe_user_need.id}", ip_need_path(@academe_user_need)
    assert_select 'input' do |btn|
      btn.each do |s|
        assert_no_match 'Subscribe', btn.to_s
      end
    end
  end

  test "academe user should not see unsubscribe button on its own need" do
    log_in_as(@academe_user)
    assert is_logged_in?
    get ip_need_path(@academe_user_need)
    assert_template "ip_needs/show"
    assert_dom_equal "/ip_needs/#{@academe_user_need.id}", ip_need_path(@academe_user_need)
    @academe_user.follow(@academe_user_need)
    get ip_need_path(@academe_user_need)
    assert_select 'input' do |btn|
      btn.each do |s|
        assert_no_match 'Unsubscribe', btn.to_s
      end
    end
  end

  test "industry user should not see subscribe button on its own need" do
    log_in_as(@industry_user)
    assert is_logged_in?
    get ip_need_path(@industry_user_need)
    assert_template "ip_needs/show"
    assert_dom_equal "/ip_needs/#{@industry_user_need.id}", ip_need_path(@industry_user_need)
    assert_select 'input' do |btn|
      btn.each do |s|
        assert_no_match 'Subscribe', btn.to_s
      end
    end
  end

  test "industry user should not see unsubscribe button on its own need" do
    log_in_as(@industry_user)
    assert is_logged_in?
    get ip_need_path(@industry_user_need)
    assert_template "ip_needs/show"
    assert_dom_equal "/ip_needs/#{@industry_user_need.id}", ip_need_path(@industry_user_need)
    @industry_user.follow(@industry_user_need)
    get ip_need_path(@industry_user_need)
    assert_select 'input' do |btn|
      btn.each do |s|
        assert_no_match 'Unsubscribe', btn.to_s
      end
    end
  end

end
