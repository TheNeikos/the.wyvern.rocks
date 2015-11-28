require 'rails_helper'

RSpec.describe "topics/new.html.haml", :type => :view do
  let (:topic) { build :topic }
  it "displays an name field" do
    assign(:topic, topic)
    assign(:category, topic.category)
    render
    expect(rendered).to match(/topic_name/)
  end
end
