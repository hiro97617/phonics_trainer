require "test_helper"

class Admin::MultipleQuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_multiple_questions_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_multiple_questions_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_multiple_questions_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_multiple_questions_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_multiple_questions_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_multiple_questions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_multiple_questions_destroy_url
    assert_response :success
  end
end
