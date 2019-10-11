class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.references :user, foreign_key: true, null: false
      t.string :shop_name, null: false
      t.string :tel, null: false
      t.string :adress
      t.string :access
      t.string :business_hours
      t.string :nearest_station
      t.text :shop_info

      t.timestamps
    end
  end
end
