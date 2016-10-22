require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout_links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 3
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", expertise_path
    assert_select "a[href=?]", itso_ipophl_path
    assert_select "a[href=?]", resources_path
    assert_select "a[href=?]", register_path
  end

end
