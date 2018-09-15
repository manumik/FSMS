class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :orderid
      t.integer :kunde
      t.integer :datei
      t.integer :status

      t.timestamps
    end
  end
end
