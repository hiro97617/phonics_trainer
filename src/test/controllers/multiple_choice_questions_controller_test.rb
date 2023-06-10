require "test_helper"

class MultipleChoiceQuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get multiple_choice_questions_top_url
    assert_response :success
  end

  test "should get index" do
    get multiple_choice_questions_index_url
    assert_response :success
  end
end
