class AddLagerToDatens < ActiveRecord::Migration[5.1]
  def change
    add_column :datens, :lager, :integer
    
  end
end
