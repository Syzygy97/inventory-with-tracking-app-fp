class AddReferenceOfMarkersToAsset < ActiveRecord::Migration[7.0]
  def change
    add_reference :markers, :asset, null: false, foreign_key: true
  end
end
