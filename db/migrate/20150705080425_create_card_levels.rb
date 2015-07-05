class CreateCardLevels < ActiveRecord::Migration
  def change
    create_table :card_levels do |t|
    	t.integer "agent_id"
    	t.integer "level", :limit => 1
    	t.string "name"
      t.timestamps null: false
    end
  end
end
