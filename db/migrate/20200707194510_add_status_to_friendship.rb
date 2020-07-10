class AddStatusToFriendship < ActiveRecord::Migration[5.2]
  def change
    add_column :friendships, :status, :string
    remove_column :friendships, :confirmed
  end
end
