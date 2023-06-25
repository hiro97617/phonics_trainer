require "test_helper"

class OutlinesControllerTest < ActionDispatch::IntegrationTest
  test "should get static_page" do
    get outlines_static_page_url
    assert_response :success
  end
end
