class AddFirstNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, limit: 32
    add_column :users, :last_name, :string, limit: 32
  end
end
