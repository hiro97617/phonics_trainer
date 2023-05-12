require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get user_name:string_url
    assert_response :success
  end

  test "should get email:string" do
    get user_email:string_url
    assert_response :success
  end

  test "should get crypted_password:string" do
    get user_crypted_password:string_url
    assert_response :success
  end

  test "should get salt:string" do
    get user_salt:string_url
    assert_response :success
  end
end
