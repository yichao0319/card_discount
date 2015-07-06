class ChangeJointTypeToNameInCard < ActiveRecord::Migration
  def change
  	add_column :cards, :name, :string
  	remove_column :cards, :joint_type, :string
  end
end
