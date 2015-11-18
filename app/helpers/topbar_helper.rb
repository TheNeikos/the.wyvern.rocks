module TopbarHelper
  def topbar_link_to link, content
    content_tag(:li, content_tag(:a, content, href: link),
                class: [(:active if current_page?(link))])
  end

  def topbar_dropdown link, content, &block
    content_tag(:li,
                content_tag(:a, content, href: link) +
                content_tag(:ul, capture(&block), class:['dropdown']),
                class: ['has-dropdown'])
  end
end
