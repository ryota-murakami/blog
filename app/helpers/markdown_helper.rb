module MarkdownHelper
  def markdown(text)
    unless @Markdown
      renderer = Redcarpet::Render::HTML.new
      @markdown = Redcarpet::Markdown::new(renderer)
    end

    @markdown.render(text).html_safe
  end
end
