require 'test_helper'

class PageControllerTest < ActionController::TestCase
  test "GET # /about/page" do
    get :about
    assert_response :success
    assert_template :about
  end
end
