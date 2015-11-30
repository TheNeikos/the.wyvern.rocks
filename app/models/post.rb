class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic


  validates :content, presence: true, length: { maximum: 100_000 }

  def anchor
    "post_#{id}"
  end
end
