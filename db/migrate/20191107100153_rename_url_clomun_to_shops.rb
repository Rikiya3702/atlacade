class RenameUrlClomunToShops < ActiveRecord::Migration[5.1]
  def change
    rename_column :shops, :url, :official_url
  end
end
