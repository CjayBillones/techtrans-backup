require 'test_helper'

class IpOfferTest < ActiveSupport::TestCase

  def setup
    @user = users(:cjay)
    @ip_offer = @user.ip_offers.build(title:"Lorem Ipsum", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
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

  test "content should be present" do
    @ip_offer.description = " "
    assert_not @ip_offer.valid?
  end

  test "order should be most recent first" do
    assert_equal ip_offers(:uprint), IpOffer.first
  end

end