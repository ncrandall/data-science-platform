class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_index :users, [:username], { name: 'unique_username_index', unique: true }
  end
end
