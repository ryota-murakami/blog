require 'test_helper'

class PageControllerTest < ActionController::TestCase
  test "GET /page/profile" do
    get :profile
    assert_response :success
    assert_template :profile
  end
end
