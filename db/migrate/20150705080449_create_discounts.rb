class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.integer "group_id"
      t.integer "store_id"
      t.integer "discount_index", :limit => 1
      t.integer "discount_type_id", :limit => 1
      t.string "brief_description"
      t.text "complete_description"
      t.string "notice"
      t.date "start_date"
      t.date "end_date"
      t.integer "rating", :limit => 1
      t.string "reference"
      t.timestamps null: false
    end
  end
end
