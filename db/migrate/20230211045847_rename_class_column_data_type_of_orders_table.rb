class RenameClassColumnDataTypeOfOrdersTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :class, :classification
  end
end
