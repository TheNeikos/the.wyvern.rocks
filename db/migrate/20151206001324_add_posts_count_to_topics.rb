class AddPostsCountToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :posts_count, :number
  end
end
