require "test_helper"

class Admin::LevelPartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_level_parts_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_level_parts_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_level_parts_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_level_parts_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_level_parts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_level_parts_destroy_url
    assert_response :success
  end
end
