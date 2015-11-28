require 'rails_helper'

RSpec.describe Topic, :type => :model do
  context "is valid" do
    let(:topic) { build :topic }

    it "when factory is used" do
      expect(topic).to be_valid
    end
  end
  context "is invalid" do
    let(:topic) { build :topic }

    it "when name is not given" do
      topic.name = ""
      expect(topic).to_not be_valid
    end

    it "when name is less than 5 characters" do
      topic.name = "1234"
      expect(topic).to_not be_valid
    end

    it "when name is more than 30 characters" do
      topic.name = "a" * 31
      expect(topic).to_not be_valid
    end

    it "when category is not given" do
      topic.category = nil
      expect(topic).to_not be_valid
    end

    it "when user is not given" do
      topic.user = nil
      expect(topic).to_not be_valid
    end

    it "when papertrail is not enabled" do
      expect(topic.paper_trail_enabled_for_model?).to_not be(false)
    end
  end
end
