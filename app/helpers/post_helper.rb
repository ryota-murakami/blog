module PostHelper
  def article_format(str)
    str = escape_article(str)
    str = nl2br(str)
    url_to_hatena_blog_card(str)
  end

  def url_to_hatena_blog_card(str)
    str.gsub(/\[(https?:\/\/\S+):embed:cite\]/, '<iframe src="https://hatenablog-parts.com/embed?url=\1" scrolling="no" frameborder="0" style="width:100%; height:155px; max-width:500px;"></iframe>')
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
