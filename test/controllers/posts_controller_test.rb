require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "get rss feed" do
    get :index, format: :rss
    assert_response :success
  end

  test "GET #index page" do
    get :index
    assert_response :success
  end
end
