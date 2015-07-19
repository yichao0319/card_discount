class CreateCardRatings < ActiveRecord::Migration
  def change
    create_table :card_ratings do |t|
      t.integer :rating
      t.text :comment
      t.integer :card_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
