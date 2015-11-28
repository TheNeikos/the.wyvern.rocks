class CreateCategoryRoles < ActiveRecord::Migration
  def change
    create_table :category_roles do |t|
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
