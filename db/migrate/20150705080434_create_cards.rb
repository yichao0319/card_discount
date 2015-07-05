class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
    	t.integer "bank_id"
    	t.integer "card_type_id"
    	t.integer "card_level_id"
    	t.string "joint_type"
    	t.string "reference"
      t.timestamps null: false
    end
  end
end
