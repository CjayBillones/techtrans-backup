require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @academe = Academe.create(user_type: "Student", id_number: "2012-00000")
    @user = User.new(first_name: "Example", last_name: "User", email: "user@example.com",
                    username: "username", password: "foobar", password_confirmation: "foobar", 
                    accounts_type: "Academe", accounts_id: @academe.id)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "first name should be present" do
    @user.first_name = " "
    assert_not @user.valid?
  end

  test "last name should be present" do
    @user.last_name = "    "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
  
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end

  test "associated articles should be destroyed" do
    @user.save
    @user.articles.create!(title: "Lorem ipsum", content: "Lorem ipsum")
    assert_difference 'Article.count', -1 do
      @user.destroy
    end
  end

  test "associated ip_offers should be destroyed" do
    @user.save
    @user.ip_offers.create!(title: "Lorem ipsum", overview: "Lorem ipsum")
    assert_difference 'IpOffer.count', -1 do
      @user.destroy
    end
  end

  test "associated ip_needs should be desroyed" do
    @user.save
    @user.ip_needs.create!(title: "Lorem ipsum", description: "Lorem ipsum")
    assert_difference 'IpNeed.count', -1 do
      @user.destroy
    end
  end
end
