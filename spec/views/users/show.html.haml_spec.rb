require 'rails_helper'

RSpec.describe "users/show.html.haml", :type => :view do
  it "displays the user's name" do
    user = create(:user)
    assign(:user, user)
    render
    expect(rendered).to match(/#{user.name}/)
  end
end
