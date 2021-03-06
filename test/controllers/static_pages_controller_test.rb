require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "IP Technology Transfer Unit"
  end

  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get expertise" do
    get expertise_path
    assert_response :success
    assert_select "title", "Expertise | #{@base_title}"
  end

  test "should get itso_ipophl" do
    get itso_ipophl_path
    assert_response :success
    assert_select "title", "ITSO-IPOPHL | #{@base_title}"
  end

  test "should get resources" do
    get resources_path
    assert_response :success
    assert_select "title", "Resources | #{@base_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

  test "should get academe register" do
    get register_academes_path
    assert_response :success
    assert_select "title", "Register | #{@base_title}"
  end

  test "should get industry register" do
    get register_industries_path
    assert_response :success
    assert_select "title", "Register | #{@base_title}"
  end

end
