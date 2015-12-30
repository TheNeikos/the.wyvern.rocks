class MailToken < ActiveRecord::Base
  belongs_to :user

  before_create on: :create do
    self.token = SecureRandom.hex 32
    self.valid_until = 1.day.from_now
  end

  def valid_token_at? date
    date < self.valid_until
  end
end
