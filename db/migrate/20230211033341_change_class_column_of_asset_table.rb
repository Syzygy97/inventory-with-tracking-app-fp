class ChangeClassColumnOfAssetTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :assets, :class, :classification
  end
end
