module ApplicationHelper
  include Pundit
  def markdown(text)
    options = {no_intra_emphasis: true, tables: true,
               fenced_code_blocks: true, disable_indented_code_block: true,
               strikethrough: true, superscript: true, underline: true,
               footnotes: true, hard_wrap: true, safe_links_only: true,
               escape_html: true, link_attributes: {rel:"nofollow", target:"_blank"}}
    renderer = TwrRenderer.new(options)
    Redcarpet::Markdown.new(renderer, options).render(text.freeze).html_safe
  end
end
