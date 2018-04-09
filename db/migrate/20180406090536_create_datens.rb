class CreateDatens < ActiveRecord::Migration[5.1]
  def change
    create_table :datens do |t|
      t.string :name
      t.string :dateipfad
      t.integer :kategorie
      t.integer :studiengang
      t.integer :modul
      t.string :semester
      t.integer :professor
      t.string :autor
      t.boolean :druckbar
      t.boolean :sichtbar
      t.boolean :sendbar
      t.timestamp :hinzugefuegt
      t.float :preis

      t.timestamps
    end
  end
end
