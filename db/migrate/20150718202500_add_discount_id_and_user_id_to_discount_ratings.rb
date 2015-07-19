class AddDiscountIdAndUserIdToDiscountRatings < ActiveRecord::Migration
  def change
    add_column :discount_ratings, :discount_id, :integer
    add_column :discount_ratings, :user_id, :integer
  end
end
