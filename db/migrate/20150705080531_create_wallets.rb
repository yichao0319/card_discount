class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
    	t.integer "user_id"
    	t.integer "card_id"
      t.timestamps null: false
    end
  end
end
