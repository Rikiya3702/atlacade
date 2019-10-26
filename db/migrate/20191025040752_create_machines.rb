class CreateMachines < ActiveRecord::Migration[5.1]
  def change
    create_table :machines do |t|
      t.string :title, null: false
      t.string :maker
      t.string :genre

      t.timestamps
    end
  end
end
