require 'rails_helper'

RSpec.describe "layouts/application.html.haml", :type => :view do
  it "displays the notice flash" do
    flash[:notice] = "asdf"
    render
    expect(rendered).to match(flash[:notice])
  end
end
