xml.instruct!

xml.rss("version"    => "2.0",
        "xmlns:dc"   => "http://purl.org/dc/elements/1.1/",
        "xmlns:atom" => "http://www.w3.org/2005/Atom") do
  xml.channel do
    xml.title       get_title()
    xml.link        'http://malloc.tokyo'
    xml.pubDate     Time.now.rfc822
    xml.description '日常で感じた技術以外の話題を書いていますヽ(*・ω・)ﾉ'
    xml.atom :link, "href" => @rss_url, "rel" => "self", "type" => "application/rss+xml"

    @posts.each do |post|
      xml.item do
        xml.title        post.title
        xml.link         'http://malloc.tokyo' + post_path(post)
        xml.guid         'http://malloc.tokyo' + post_path(post)
        xml.description  post.text
        xml.pubDate      post.created_at.to_formatted_s(:rfc822)
        xml.dc :creator, 'ryota-murakami'
      end
    end
  end
end
