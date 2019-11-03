class CreateShopMachines < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_machines do |t|
      t.references :shop, foreign_key: true, null: false
      t.references :machine, foreign_key: true, null: false
      t.string :price, default: "100円"
      t.integer :own, default: 0

      t.timestamps
    end
  end
end
