require 'rails_helper'

RSpec.describe "main/index.html.haml", :type => :view do
  let (:category) { create :category, :with_topics }

  it "displays the category's name" do
    assign(:categories, [category])
    render
    expect(rendered).to match(/#{category.name}/)
    category.topics.each do |t|
      expect(rendered).to match(/#{t.name}/)
    end
  end
end
