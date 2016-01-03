require 'rails_helper'

RSpec.describe "topics/show.html.haml", :type => :view do
  let (:topic) { create :topic }
  it "displays an name field" do
    assign(:topic, topic)
    render
    expect(rendered).to match(topic.name)
  end

  describe "when logged in" do
    let (:user) { create :user, :has_active_session }
    before :each do
      session[:user_id] = user.id
      session[:sess_id] = user.sessions.first.id
    end
    it "displays a reply button when logged in" do
      assign(:topic, topic)
      render
      expect(rendered).to match(/Reply/)
    end
    it "does not display a reply button when not authorized" do
      session[:sess_id] = nil
      assign(:topic, topic)
      render
      expect(rendered).to_not match(/Reply/)
    end
  end

  describe "when having replies" do
    let (:topic) { create :topic, :with_posts }

    it "should display those replies" do
      assign(:topic, topic)
      render
      topic.posts.each do |p|
        expect(rendered).to match(p.content)
      end
    end
  end
end
