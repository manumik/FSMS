class AddSeitenToOders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :seiten, :integer
  end
end
