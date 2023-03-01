class UpdateMarkersTableColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :markers, :elevation
    add_column :markers, :notes, :string
    add_column :markers, :deployment_date, :date
    add_column :markers, :deployment_time, :time
    add_column :assets, :rent_price, :decimal, precision: 11, scale: 2
  end
end
