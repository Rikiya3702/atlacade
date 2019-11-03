class AddImageColumnToShop < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :image, :string
  end
end
