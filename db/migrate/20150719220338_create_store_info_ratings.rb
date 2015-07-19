class CreateStoreInfoRatings < ActiveRecord::Migration
  def change
    create_table :store_info_ratings do |t|
      t.integer :rating
      t.text :comment
      t.integer :store_info_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
