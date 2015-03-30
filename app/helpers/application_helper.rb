module ApplicationHelper

  def nl2br(str)
      str = html_escape(str)
      str.gsub(/\r\n|\r|\n/, "<br>").html_safe
  end

  def escape_article(str)
      str.gsub(/<(script.?)>/x,"&lt;\\1&gt;").gsub(/<(style.?)>/x,"&lt;\\1&gt;").gsub(/\r\n|\r|\n/, "<br>").html_safe
  end

end
