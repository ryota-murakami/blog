module ApplicationHelper

  def nl2br(str)
      str = html_escape(str)
      str.gsub(/\r\n|\r|\n/, "<br>").html_safe
  end

  def escape_article(str)
      str.gsub(/<(script.?)>/x,"&lt;\\1&gt;").gsub(/<(style.?)>/x,"&lt;\\1&gt;").html_safe
  end

  def pick_datetime(time)
    time.to_s.gsub(/^(\d{4}-\d{2}-\d{2}) \d{2}:\d{2}:\d{2} .{3}$/,"\\1")
  end

end
