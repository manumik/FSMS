class ChangePreisAtDatens < ActiveRecord::Migration[5.1]
  def change
    change_column :datens, :preis, :float, :default => 0.0
  end
end
