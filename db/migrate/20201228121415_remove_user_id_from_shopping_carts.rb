class RemoveUserIdFromShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    remove_column :shopping_carts, :user_id, :bigint
  end
end
