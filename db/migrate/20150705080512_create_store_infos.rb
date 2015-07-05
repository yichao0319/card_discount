class CreateStoreInfos < ActiveRecord::Migration
  def change
    create_table :store_infos do |t|
    	t.string "name"
    	t.string "country"
    	t.string "city"
    	t.string "district"
    	t.integer "zip", :limit => 2
    	t.string "street"
    	t.string "phone"
    	t.string "official_site"
    	t.string "rate_reference"
    	t.integer "rating", :limit => 1
      t.timestamps null: false
    end
  end
end
