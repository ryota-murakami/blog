module ApplicationHelper

  def nl2br(str)
      str = html_escape(str)
      str.gsub(/\r\n|\r|\n/, "<br>").html_safe
  end

  def article_format(str)
    str = escape_article(str)
    url_to_hatena_blog_card(str)
  end

  def url_to_hatena_blog_card(str)
    str.gsub(/(https?:\/\/\S+)/, '<iframe src="http://hatenablog.com/embed?url=\1" scrolling="no" frameborder="0" style="width:100%; height:155px; max-width:500px;"></iframe>')
  end

  def escape_article(str)
      str.gsub(/<(script.?)>/x,"&lt;\\1&gt;").gsub(/<(style.?)>/x,"&lt;\\1&gt;").html_safe
  end

  def pick_datetime(time)
    time.to_s.gsub(/^(\d{4}-\d{2}-\d{2}) \d{2}:\d{2}:\d{2} .{3}$/,"\\1")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def check_route(controller_name, action_name)
    controller.controller_name == controller_name && controller.action_name == action_name
  end

end
