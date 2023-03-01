class ChangePriceColumnPrecision < ActiveRecord::Migration[7.0]
  def change
    change_column :assets, :price, :decimal, precision: 11, scale: 2
    change_column :orders, :price, :decimal, precision: 11, scale: 2
  end
end
