class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.string :name
      t.string :description
      t.integer :class
      t.integer :status
      t.integer :quantity
      t.datetime :purchase_date
      t.integer :invoice_number

      t.timestamps
    end
  end
end
