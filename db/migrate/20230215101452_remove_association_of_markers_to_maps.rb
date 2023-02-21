class RemoveAssociationOfMarkersToMaps < ActiveRecord::Migration[7.0]
  def change
    remove_reference :markers, :map
  end
end
