require 'rails_helper'

RSpec.describe "categories/show.html.haml", :type => :view do
  let (:category) { create :category, :with_topics }

  it "displays the category's name" do
    assign(:category, category)
    render
    expect(rendered).to match(/#{category.name}/)
    category.topics.each do |t|
      expect(rendered).to match(/#{t.name}/)
    end
  end

  context "with a logged in user" do
    let (:user) { create :user, :has_active_session }

    before :each do
      session[:user_id] = user.id
      session[:sess_id] = user.sessions.first.id
    end

    it "displays new topic button" do
      assign(:category, category)
      render
      expect(rendered).to match(/New Topic/)
    end
  end
end
