class RemoveColumnRatingInDiscountsAndStoreInfos < ActiveRecord::Migration
  def change
    remove_column :discounts, :rating, :tinyint
    remove_column :store_infos, :rating, :tinyint
  end
end
