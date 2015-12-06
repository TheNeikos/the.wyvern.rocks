class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic, counter_cache: true


  validates :content, presence: true, length: { maximum: 100_000 }

  def anchor
    "post_#{id}"
  end
end
