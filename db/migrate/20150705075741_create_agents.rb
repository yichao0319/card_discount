class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
    	t.string "name"
      t.timestamps null: false
    end
  end
end
