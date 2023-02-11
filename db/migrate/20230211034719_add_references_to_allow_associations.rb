class AddReferencesToAllowAssociations < ActiveRecord::Migration[7.0]
  def change
    add_reference :assets, :category, null: false, foreign_key: true
    add_reference :markers, :map, null: false, foreign_key: true
  end
end
