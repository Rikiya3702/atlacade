class AddInfoColumnToMachine < ActiveRecord::Migration[5.1]
  def change
    add_column :machines, :machine_info, :text
  end
end
