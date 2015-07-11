class ChangeUsersPriviligeType < ActiveRecord::Migration
  def change
    remove_column :users, :privilege, :int
    add_column :users, :privilege, :int, default: 0
  end
end
