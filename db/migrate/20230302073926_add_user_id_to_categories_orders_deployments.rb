class AddUserIdToCategoriesOrdersDeployments < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :user_id, :integer
    add_index :categories, :user_id
    add_column :orders, :user_id, :integer
    add_index :orders, :user_id
    add_column :deployments, :user_id, :integer
    add_index :deployments, :user_id
  end
end
