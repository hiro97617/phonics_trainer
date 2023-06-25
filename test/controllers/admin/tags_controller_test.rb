require "test_helper"

class Admin::TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_tags_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_tags_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_tags_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_tags_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_tags_destroy_url
    assert_response :success
  end
end
