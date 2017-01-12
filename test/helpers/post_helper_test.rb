require 'test_helper'

describe MarkdownHelper do
  before do
    class TestHelper < ActionView::Base
      include PostHelper
    end
    @helper = TestHelper.new
  end

  describe "URLをはてなブログカードに変換する機能の動作確認" do
    it "http URLがはてなブログカードに変換される" do
      assert_match '<iframe src="https://hatenablog-parts.com/embed?url=http://example.com" scrolling="no" frameborder="0" style="width:100%; height:155px; max-width:500px;"></iframe>', @helper.url_to_hatena_blog_card('[http://example.com:embed:cite]')
    end

    it "https URLがはてなブログカードに変換される" do
      assert_match '<iframe src="https://hatenablog-parts.com/embed?url=https://example.com" scrolling="no" frameborder="0" style="width:100%; height:155px; max-width:500px;"></iframe>', @helper.url_to_hatena_blog_card('[https://example.com:embed:cite]')
    end

    it ":embed:cite指定以外のURLは変換されない" do
      assert_match 'http://example.com', @helper.url_to_hatena_blog_card('http://example.com')
    end

  end
end
