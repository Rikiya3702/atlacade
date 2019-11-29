class AddColumnsToShopTag < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :url, :string
    add_column :tags, :hand_towel, :boolean
    add_column :tags, :locker, :boolean
    add_column :tags, :wifi, :boolean
  end
end
