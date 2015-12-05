require 'rails_helper'

RSpec.describe "post/edit.html.haml", :type => :view do
  let (:topic) { create :topic, :with_posts }
  it "displays a content field" do
    assign(:post, topic.posts.first)
    render
    expect(rendered).to match(/content/)
  end

  it "displays an error when invalid" do
    post = topic.posts.first
    post.valid?
    assign(:post, post)
    render
    expect(rendered).to match(/error/)
  end
end
