require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(title: 'five5')
  end

  test 'should be valid' do
     assert @post.valid?
  end

  test 'should be present' do
    @post.title = nil

    assert_not @post.valid?
  end

  test 'should be 5 minimum length' do
    @post.title = 'four'

    assert_not @post.valid?
  end
end
