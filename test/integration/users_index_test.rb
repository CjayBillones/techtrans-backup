require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin     = users(:cjay)
    @non_admin = users(:dyosa)
  end

  test "index as admin including pagination and delete links show activated" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    #assert_select 'div.pagination'
    #first_page_of_users = User.paginate(page: 1)
    User.all.each do |user|
      if user.activated?
        assert_select 'a[href=?]', user_path(user), text: fullname(user)
        unless user == @admin
          assert_select 'a[href=?]', user_path(user), text: 'Delete'
        end
      else
        assert_select 'a[href=?]', user_path(user), text: fullname(user), count: 0
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end
end
