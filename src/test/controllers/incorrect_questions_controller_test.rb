require "test_helper"

class IncorrectQuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get incorrect_questions_create_url
    assert_response :success
  end
end
