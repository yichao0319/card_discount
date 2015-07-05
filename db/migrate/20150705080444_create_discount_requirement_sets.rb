class CreateDiscountRequirementSets < ActiveRecord::Migration
  def change
    create_table :discount_requirement_sets do |t|
    	t.integer "discount_id"
    	t.integer "bank_id"
    	t.integer "card_id"
    	t.integer "card_level_id"
      t.timestamps null: false
    end
  end
end
