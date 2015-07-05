class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
    	t.integer "swift_number", :limit => 2
    	t.string "name"
      t.timestamps null: false
    end
  end
end
