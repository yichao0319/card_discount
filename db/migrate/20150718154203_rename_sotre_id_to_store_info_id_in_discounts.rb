class RenameSotreIdToStoreInfoIdInDiscounts < ActiveRecord::Migration
  def change
    rename_column :discounts, :store_id, :store_info_id
  end
end
