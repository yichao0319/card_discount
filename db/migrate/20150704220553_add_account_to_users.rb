class AddAccountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account, :string, :uniq
    add_column :users, :privilege, :int
    add_column :users, :gender, :string
    add_column :users, :birthday, :date
    add_column :users, :city, :string
  end
end
