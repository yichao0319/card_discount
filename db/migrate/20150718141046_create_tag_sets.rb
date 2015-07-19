class CreateTagSets < ActiveRecord::Migration
  def change
    create_table :tag_sets do |t|
      t.integer :tag_id
      t.integer :discount_id

      t.timestamps null: false
    end
  end
end
