require 'rails_helper'

RSpec.describe "posts/_post.html.haml", :type => :view do
  let (:topic) { create :topic, :with_posts }
  let (:post) {topic.posts.first}
  it "displays the id of the post" do
    render partial: "posts/post.html.haml", locals: {post: post}
    expect(rendered).to match(post.anchor)
  end
  it "displays a link to the post" do
    render partial: "posts/post.html.haml", locals: {post: post}
    expect(rendered).to match(/##{post.position}/)
  end
  it "display an edit when the user is logged in" do
    session[:user_id] = post.user.id
    session[:sess_id] = post.user.sessions.create(ip: "localtest").id
    render partial: "posts/post.html.haml", locals: {post: post}
    expect(rendered).to match(/Edit/)
  end
end
