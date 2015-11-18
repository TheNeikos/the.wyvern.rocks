class Session < ActiveRecord::Base
  belongs_to :user

  default_scope { where('created_at > ?' , 7.days.ago) }

  validates :ip, presence: true

  def active?
    created_at > 7.days.ago
  end
end
