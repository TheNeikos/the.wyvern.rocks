require 'rails_helper'

RSpec.describe Session, :type => :model do
  context "is valid" do
    let(:user) { build :user }
    it "when user is given" do
      session = Session.new user: user, ip: "localtest"
      expect(session).to be_valid
    end

    it "when session is younger than a week" do
      session = Session.create user: user, ip: "localtest"
      session = Session.where(id: session.id)
      expect(session).to_not be_empty
    end
  end
  context "is not valid" do
    let(:user) { build :user }
    it "when session is older than a week" do
      session = Session.create user: user, created_at: 8.days.ago
      session = Session.where(id: session.id).all
      expect(session).to be_empty
    end
    it "when session has no IP Addr" do
      session = Session.create user: user
      expect(session).to_not be_valid
    end
  end
end
