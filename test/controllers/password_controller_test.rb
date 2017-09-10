require 'test_helper'

class PasswordControllerTest < ActionController::TestCase
  test "should get forget_password" do
    get :forget_password
    assert_response :success
  end

  test "should get reset_password" do
    get :reset_password
    assert_response :success
  end

end
