class AddPhotoColumnToStoreInfo < ActiveRecord::Migration
  def change
  	add_column :store_infos, :photo, :string
  end
end
