class AddPriceColumnToOrdersTableAndAssetsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :price, :decimal, precision: 8, scale: 2
    add_column :assets, :price, :decimal, precision:  8, scale: 2
  end
end
