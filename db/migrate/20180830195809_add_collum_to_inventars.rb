class AddCollumToInventars < ActiveRecord::Migration[5.1]
  def change
    add_column :invetars, :bezug, :integer
  end
end
