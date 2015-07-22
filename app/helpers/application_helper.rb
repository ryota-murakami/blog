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

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

end
