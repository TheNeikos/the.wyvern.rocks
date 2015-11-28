require 'rails_helper'

RSpec.describe "categories/show.html.haml", :type => :view do
  let :category do
    create :category
  end
  it "displays the category's name" do
    assign(:category, category)
    render
    expect(rendered).to match(/#{category.name}/)
  end
end
