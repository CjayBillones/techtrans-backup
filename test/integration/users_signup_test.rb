require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end

  #test "invalid signup information" do
  #  get register_path
  #  assert_no_difference 'User.count' do
  #    post users_path, params: { user: {
  #                                      first_name: " ",
  #                                      last_name: " ", 
  #                                      email: "user@invalid",
  #                                      password: "foo",
  #                                      password_confirmation: "bar" } }
  #  end
  #  assert_template 'users/new'
  #  assert_select 'div#error_explanation'
  #  assert_select 'div.field_with_errors'
  #end

  test "invalid academes signup information" do
    get register_academes_path
    assert_no_difference 'User.count' do
      post academes_path, params: { user: {
                                          first_name: " ",
                                          last_name: " ",
                                          email: "user@invalid",
                                          password: "foo",
                                          password_confirmation: "bar",
                                    },
                                    academe: {
                                          user_type: "Student",
                                          id_number: "2011-40095"
                                    }
      }
    end
    assert_template 'academes/new'
    #assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "invalid industries signup information" do
    get register_industries_path
    assert_no_difference 'User.count' do
      post industries_path, params: { user: {
                                            first_name: "Cjay",
                                            last_name: "Billones",
                                            email: "user@example.com",
                                            password: "foobar",
                                            password_confirmation: "foobar"
                                    },
                                    industry: {
                                            industry_name: " ",
                                            country_code: "PHL",
                                    }
      }
    end
    assert_template 'industries/new'
    #assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid signup information with account activation for industries" do
    get register_industries_path
    assert_difference 'User.count', 1 do
      post industries_path, params: { user: {
                                            first_name: "Example",
                                            last_name: "User",
                                            email: "user@example.com",
                                            password: "password",
                                            password_confirmation: "password",
                                    },
                                    industry: {
                                      industry_name: "UP Center for Student Innovations",
                                      country_code: "PHL",
                                      contact_email: "dcs.innovate@gmail.com",
                                      employee_count: 1
                                    }
      }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    log_in_as(user)
    assert_not is_logged_in?
    get edit_account_activation_path("invalid token", email: user.email) # Invalid Token
    assert_not is_logged_in?
    get edit_account_activation_path(user.activation_token, email: 'wrong@email.com') # Wrong Email
    assert_not is_logged_in?
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end

  test "valid signup information with account activation for academes" do
    get register_academes_path
    assert_difference 'User.count', 1 do
      post academes_path, params: { user: {
                                            first_name: "Example",
                                            last_name: "User",
                                            email: "user@example.com",
                                            password: "password",
                                            password_confirmation: "password",
                                    },
                                    academe: {
                                      user_type: "Student",
                                      id_number: "201227860",
                                      contact_number: " "
                                    }
      }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    log_in_as(user)
    assert_not is_logged_in?
    get edit_account_activation_path("invalid token", email: user.email) # Invalid Token
    assert_not is_logged_in?
    get edit_account_activation_path(user.activation_token, email: 'wrong@email.com') # Wrong Email
    assert_not is_logged_in?
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
  
end
