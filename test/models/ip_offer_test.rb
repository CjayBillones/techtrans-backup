require 'test_helper'

class IpOfferTest < ActiveSupport::TestCase

  def setup
    @admin_user = users(:admin)
    @ip_offer = @admin_user.ip_offers.build(title:"Lorem Ipsum", overview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
  end

  test "should be valid" do
    assert @ip_offer.valid?
  end

  test "user_id should be present" do
    @ip_offer.user_id = nil
    assert_not @ip_offer.valid?
  end

  test "title should be present" do
    @ip_offer.title = " "
    assert_not @ip_offer.valid?
  end

  test "title should be at most 255 characters" do
    @ip_offer.title = "a" *256
    assert_not @ip_offer.valid?
  end

  #test "content should be present" do
  #  @ip_offer.overview = " "
  #  assert_not @ip_offer.valid?
  #end

  test "order should be most recent first" do
    assert_equal ip_offers(:offer_three), IpOffer.first
  end

end
