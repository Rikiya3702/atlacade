class AddOfficialurlToMachines < ActiveRecord::Migration[5.1]
  def change
    add_column :machines, :official_url, :string
  end
end
