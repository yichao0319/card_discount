class CreateDiscountRatings < ActiveRecord::Migration
  def change
    create_table :discount_ratings do |t|
      t.integer :rating
      t.text :comment

      t.timestamps null: false
    end
  end
end
