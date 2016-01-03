class TwrRenderer < Redcarpet::Render::HTML
  def block_code(code, language)
    add_surround_code_tags Pygments.highlight(code, lexer: language), language
  end

  def add_surround_code_tags(code, lang)
    code = code.sub(/<pre>/,'<div class="lang">' + lang + '</div><pre><div class="code ' + lang + '">')
    code = code.sub(/<\/pre>/,"</div></pre>")
  end
end
