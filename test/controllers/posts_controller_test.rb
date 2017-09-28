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
    assert_template :index
  end

  test "GET posts/:id" do
    get :show, params: { id: 1 }
    assert_response :success
    assert_template :show
    assert_not_nil assigns(:post)
    assert_select 'h2', 'MyPost1'
  end
end
