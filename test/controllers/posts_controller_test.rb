require 'test_helper'

class PostsControllerTest < ActionController::TestCase
   test "get rss feed" do
     get :index, format: :rss
     assert_response :success
   end
end
