class RemovePurchaseIdFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :purchaser_id, :bigint
  end
end
