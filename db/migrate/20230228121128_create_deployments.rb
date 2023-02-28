class CreateDeployments < ActiveRecord::Migration[7.0]
  def change
    create_table :deployments do |t|
      t.string :vehicle_name
      t.string :address
      t.integer :quantity
      t.date :deployment_date
      t.time :deployment_time
      t.decimal :price, precision: 11, scale: 2
      t.string :notes
      t.integer :status

      t.timestamps
    end
  end
end
