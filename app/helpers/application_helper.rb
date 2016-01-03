module ApplicationHelper
  include Pundit
  def markdown(text)
    options = {no_intra_emphasis: true, tables: true,
               fenced_code_blocks: true, disable_indented_code_block: true,
               strikethrough: true, superscript: true, underline: true,
               footnotes: true, hard_wrap: true, safe_links_only: true}
    renderer = Redcarpet::Render::HTML.new(options)
    Redcarpet::Markdown.new(renderer, options).render(text.clone).html_safe
  end
end
