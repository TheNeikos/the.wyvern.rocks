require 'rails_helper'

RSpec.describe MailToken, :type => :model do
  let(:token) { create :mail_token }

  context 'is valid' do
    it 'until tomorrow' do
      expect(token.valid_token_at?(DateTime.now)).to eq true
    end
  end

  context 'is invalid' do
    it 'after tomorrow and later' do
      expect(token.valid_token_at?(2.days.from_now)).to eq false
    end
  end
end
