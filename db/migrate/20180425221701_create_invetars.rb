class CreateInvetars < ActiveRecord::Migration[5.1]
  def change
    create_table :invetars do |t|
      t.integer :invetarnummer
      t.string :typ
      t.integer :kunden
      t.string :beschreibung
      t.timestamp :backat

      t.timestamps
    end
  end
end
