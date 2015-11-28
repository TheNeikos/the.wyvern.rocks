require 'rails_helper'

RSpec.describe "topics/show.html.haml", :type => :view do
  let (:topic) { create :topic }
  it "displays an name field" do
    assign(:topic, topic)
    render
    expect(rendered).to match(topic.name)
  end
end
