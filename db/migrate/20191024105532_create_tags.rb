class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.references :shop, foreign_key: true, null: false
      t.boolean :emoney, default: false
      t.boolean :paseli, default: false
      t.boolean :parking, default: false
      t.boolean :open24h, default: false
      t.boolean :older18, default: false
      t.integer :smoking, default: 0

      t.timestamps
    end
  end
end
