class AddNewColumnsToMapsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :maps, :latitude, :decimal, precision: 10, scale: 6
    add_column :maps, :longitude, :decimal, precision: 10, scale: 6
  end
end
