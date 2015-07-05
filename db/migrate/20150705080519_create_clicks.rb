class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
    	t.string "target_type"
    	t.integer "target_id"
    	t.integer "count"
      t.timestamps null: false
    end
  end
end
