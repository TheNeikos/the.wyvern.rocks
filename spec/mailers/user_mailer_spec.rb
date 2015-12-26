require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  before :each do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
  end

  after :each do
    ActionMailer::Base.deliveries.clear
  end

  describe "verification_email" do
    it "should be sent succesfully" do
      token = create(:mail_token)
      UserMailer.confirmation_mail(token).deliver_now
      expect(ActionMailer::Base.deliveries.size).to eq 1
      expect(ActionMailer::Base.deliveries[0].to_s.match(token.token)).to_not be_nil
    end
  end
end
