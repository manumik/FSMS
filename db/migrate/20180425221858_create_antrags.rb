class CreateAntrags < ActiveRecord::Migration[5.1]
  def change
    create_table :antrags do |t|
      t.string :name
      t.integer :typ
      t.integer :kunden
      t.integer :status
      t.string :beschreibung

      t.timestamps
    end
  end
end
