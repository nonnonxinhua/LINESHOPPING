class AddColumnCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :item_id, :integer
    add_column :cart_items, :amount, :integer
    add_column :cart_items, :admin_id, :integer
  end
end
