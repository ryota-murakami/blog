require 'test_helper'

describe MarkdownHelper do
  before do
    class TestHelper < ActionView::Base
      include MarkdownHelper
    end
    @helper = TestHelper.new
  end

  describe "markdown_helperの動作確認" do
    it "markdownがhtmlに変換される" do
      assert_match "<h1>Title</h1>", @helper.markdown("#Title")
    end
  end
end
