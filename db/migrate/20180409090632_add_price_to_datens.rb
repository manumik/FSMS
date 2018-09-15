class AddPriceToDatens < ActiveRecord::Migration[5.1]
  def change
    add_column :datens, :seiten, :integer
    
  end
end
