require 'rails_helper'

RSpec.describe "sessions/show.html.haml", :type => :view do
  it "displays a logout button" do
    user = build(:user)
    assign(:user, user)
    render
    expect(rendered).to match(/Click here to Logout/)
  end
end
