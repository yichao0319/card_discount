class ChangeTags < ActiveRecord::Migration
  def change
    remove_column :tags, :target_type, :varchar
    remove_column :tags, :target_id, :integer
    add_column :tag_sets, :store_info_id, :integer
    add_column :tag_sets, :card_id, :integer
  end
end
