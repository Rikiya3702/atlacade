class AddMultipleIndexToShopMachine < ActiveRecord::Migration[5.1]
  def change
    add_index :shop_machines, [:shop_id, :machine_id], unique: true
  end
end
