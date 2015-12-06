require 'rails_helper'

RSpec.describe "posts/new.html.haml", :type => :view do
  let (:topic) { create :topic }
  it "displays a content field" do
    assign(:topic, topic)
    assign(:post, topic.posts.build)
    render
    expect(rendered).to match(/content/)
  end

  it "displays an error when invalid" do
    post = topic.posts.build
    post.valid?
    assign(:topic, topic)
    assign(:post, post)
    render
    expect(rendered).to match(/error/)
  end
end
