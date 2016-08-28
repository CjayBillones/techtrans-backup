require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "IP Technology Transfer Unit"
  end

  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get expertise" do
    get static_pages_expertise_url
    assert_response :success
    assert_select "title", "Expertise | #{@base_title}"
  end

  test "should get opportunities" do
    get static_pages_opportunities_url
    assert_response :success
    assert_select "title", "Opportunities | #{@base_title}"
  end

  test "should get itso_ipophl" do
    get static_pages_itso_ipophl_url
    assert_response :success
    assert_select "title", "ITSO-IPOPHL | #{@base_title}"
  end

  test "should get resources" do
    get static_pages_resources_url
    assert_response :success
    assert_select "title", "Resources | #{@base_title}"
  end

end
