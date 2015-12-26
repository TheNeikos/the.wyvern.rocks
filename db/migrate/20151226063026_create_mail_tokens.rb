class CreateMailTokens < ActiveRecord::Migration
  def change
    create_table :mail_tokens do |t|
      t.references :user, index: true, foreign_key: true
      t.string :hash
      t.datetime :valid_until

      t.timestamps
    end
  end
end
