class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :type
      t.references :user, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
