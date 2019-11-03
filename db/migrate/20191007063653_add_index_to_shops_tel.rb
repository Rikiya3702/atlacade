class AddIndexToShopsTel < ActiveRecord::Migration[5.1]
  def change
    add_index :shops, :tel, unique: true
  end
end
