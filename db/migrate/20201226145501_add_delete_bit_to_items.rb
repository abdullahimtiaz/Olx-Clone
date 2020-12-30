class AddDeleteBitToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :delete_bit, :boolean, default: false 
  end
end
