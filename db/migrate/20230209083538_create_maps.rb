class CreateMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :maps do |t|
      t.string :name
      t.string :description
      t.string :uuid
      t.string :privacy
      t.string :users_can_create_markers

      t.timestamps
    end
  end
end
