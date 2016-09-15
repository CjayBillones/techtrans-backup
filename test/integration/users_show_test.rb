require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest

  def setup
    @unactivated_user = users(:malory)  
  end

  test "must not show deactivated users" do
    get user_path(@unactivated_user)
    assert_redirected_to root_path
  end

end
