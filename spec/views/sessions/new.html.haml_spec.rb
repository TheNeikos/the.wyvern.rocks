require 'rails_helper'

RSpec.describe "sessions/new.html.haml", :type => :view do
  it "displays an email and password field" do
    assign(:user, User.new)
    render
    expect(rendered).to match(/user_email/)
    expect(rendered).to match(/user_password/)
  end

  it "displays an error when invalid" do
    user = User.new
    user.valid?
    assign(:user, user)
    render
    expect(rendered).to match(/error/)
  end
end
