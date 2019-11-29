class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :shop, foreign_key: true, null: false
      t.date :event_date, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
