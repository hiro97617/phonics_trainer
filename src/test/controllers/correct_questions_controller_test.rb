require "test_helper"

class CorrectQuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get correct_questions_create_url
    assert_response :success
  end
end
