class Add < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :lager, :integer
  end
end
