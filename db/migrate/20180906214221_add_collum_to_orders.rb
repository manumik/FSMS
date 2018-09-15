class AddCollumToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :beschreibung, :string
  end
end
