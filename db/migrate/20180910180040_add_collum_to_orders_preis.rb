class AddCollumToOrdersPreis < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :preis, :float
  end
end
