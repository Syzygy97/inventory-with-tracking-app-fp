class IncludeDefaultValueForStatusColumnOfAssetsTable < ActiveRecord::Migration[7.0]
  def change
    change_column :assets, :status, :integer, default: 0
  end
end
