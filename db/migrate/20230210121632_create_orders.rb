class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :quantity
      t.integer :class
      t.datetime :transaction_date

      t.timestamps
    end
  end
end
