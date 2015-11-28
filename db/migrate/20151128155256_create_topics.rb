class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.string :type
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
