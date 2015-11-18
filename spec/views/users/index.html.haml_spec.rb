require 'rails_helper'

RSpec.describe "users/index.html.haml", :type => :view do
  it "displays a list of users" do
    users = [create(:user), create(:user)]
    assign(:users, users)
    render
    expect(rendered).to match(/#{users[0].name}/)
    expect(rendered).to match(/#{users[1].name}/)
  end
end
