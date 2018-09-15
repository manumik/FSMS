class AddInventarsUndAntags < ActiveRecord::Migration[5.1]
  def change
    add_column :invetars, :ausleihbar, :boolean
    add_column :invetars, :pfand, :float

    add_column :antrags, :datei, :string
    add_column :antrags, :bezug, :integer

    change_column :invetars, :typ, :integer
  end
end
