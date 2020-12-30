class UserRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role_id, :bigint
  end
end
