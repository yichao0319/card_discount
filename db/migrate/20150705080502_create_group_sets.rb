class CreateGroupSets < ActiveRecord::Migration
  def change
    create_table :group_sets do |t|
    	t.integer "group_id"
    	t.integer "store_info_id"
      t.timestamps null: false
    end
  end
end
