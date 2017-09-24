module ApplicationHelper
  def nl2br(str)
      str = html_escape(str)
      str.gsub(/\r\n|\r|\n/, "<br>").html_safe
  end

  def escape_article(str)
      str.gsub(/<(script.?)>/x,"&lt;\\1&gt;").gsub(/<(style.?)>/x,"&lt;\\1&gt;").html_safe
  end

  def check_route(controller_name, action_name)
    controller.controller_name == controller_name && controller.action_name == action_name
  end

  def get_title()
      "Effective Day"
  end
end
