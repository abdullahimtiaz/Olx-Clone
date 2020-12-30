class AddColumnsToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :quantity, :integer
    add_column :items, :sold, :integer
  end
end
