class AddAddressColumnToMarkersTable < ActiveRecord::Migration[7.0]
  def change
    add_column :markers, :address, :string
  end
end
