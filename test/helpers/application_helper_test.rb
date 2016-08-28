require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  def setup
    @base_title = "IP Technology Transfer Unit"
    @about_title = "About | " + @base_title
    @expertise_title = "Expertise | " + @base_title
    @opportunities_title = "Opportunities | " + @base_title
    @itso_ipophl_title = "ITSO-IPOPHL | " + @base_title
    @resources_title = "Resources | " + @base_title
  end

  test "full title helper" do
    assert_equal full_title, @base_title
    assert_equal full_title("About"), @about_title
    assert_equal full_title("Expertise"), @expertise_title
    assert_equal full_title("Opportunities"), @opportunities_title
    assert_equal full_title("ITSO-IPOPHL"), @itso_ipophl_title
    assert_equal full_title("Resources"), @resources_title
  end
end