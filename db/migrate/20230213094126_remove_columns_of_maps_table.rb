class RemoveColumnsOfMapsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :maps, :uuid
    remove_column :maps, :privacy
    remove_column :maps, :users_can_create_markers
  end
end
