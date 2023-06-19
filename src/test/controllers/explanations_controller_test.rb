require "test_helper"

class ExplanationsControllerTest < ActionDispatch::IntegrationTest
  test "should get static_page" do
    get explanations_static_page_url
    assert_response :success
  end
end
