class RenameUserIdToRoleId < ActiveRecord::Migration
  def change
    rename_column :category_roles, :user_id, :role_id
  end
end
