class ChangeSwiftNumberTypeFromIntegerToStringInBank < ActiveRecord::Migration
  def change
  	change_column :banks, :swift_number, :string, :limit => 3
  end
end
