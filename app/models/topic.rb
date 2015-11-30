class Topic < ActiveRecord::Base
  has_paper_trail

  belongs_to :user
  belongs_to :category

  has_many :posts, counter_cache: true, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false },
            length: { minimum: 5, maximum: 30 }
  validates :user, presence: true
  validates :category, presence: true
end
