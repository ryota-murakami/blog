require 'test_helper'

class PageControllerTest < ActionController::TestCase
  def test_response_success
    get :about
    assert_response :success
  end

end
