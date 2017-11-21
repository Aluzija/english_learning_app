class AddUserIdToPacketsAndIndexOnUserId < ActiveRecord::Migration[5.1]
  def change
    add_column :packets, :user_id, :integer
    add_index :packets, :user_id
    add_foreign_key :packets, :users
  end
end
