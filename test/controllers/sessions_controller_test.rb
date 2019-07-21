require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get sessions_home_url
    assert_response :success
  end

  test "should get signin" do
    get sessions_signin_url
    assert_response :success
  end

end
