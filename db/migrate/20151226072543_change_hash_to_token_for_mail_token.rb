class ChangeHashToTokenForMailToken < ActiveRecord::Migration
  def change
    rename_column :mail_tokens, :hash, :token
  end
end
