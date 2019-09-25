class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :password
      t.integer :role
      t.string :image
      t.text :profile

      t.timestamps
    end
    add_index :users, :email, unique: true
    change_column_default :users, :role, 0
    change_column :users, :role, :integer, null: false
    change_column :users, :image, :string, null: true
    change_column :users, :profile, :text, null: true
  end
end
