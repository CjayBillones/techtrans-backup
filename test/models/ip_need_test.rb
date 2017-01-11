require 'test_helper'

class IpNeedTest < ActiveSupport::TestCase

  def setup
    @user = users(:admin)
    @ip_need = @user.ip_needs.build(title:"Lorem Ipsum", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
  end

  test "should be valid" do
    assert @ip_need.valid?
  end

  test "user_id should be present" do
    @ip_need.user_id = nil
    assert_not @ip_need.valid?
  end

  test "title should be present" do
    @ip_need.title = " "
    assert_not @ip_need.valid?
  end

  test "title should be at most 255 characters" do
    @ip_need.title = "a" *256
    assert_not @ip_need.valid?
  end

  test "content should be present" do
    @ip_need.description = " "
    assert_not @ip_need.valid?
  end

  test "order should be most recent first" do
    assert_equal ip_needs(:need_three), IpNeed.first
  end

end
