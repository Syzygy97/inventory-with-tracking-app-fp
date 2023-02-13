class ChangeDataTypeOfInvoiceNumberColumnToBigintOfAssetsTable < ActiveRecord::Migration[7.0]
  def change
    change_column :assets, :invoice_number, :bigint
  end
end
