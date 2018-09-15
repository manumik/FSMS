class CreateLagers < ActiveRecord::Migration[5.1]
  def change
    create_table :lagers do |t|
      t.string :name
      t.string :beschreibung
      t.boolean :dateiORkunde
      t.integer :inhalt
      t.integer :docAnzahl

      t.timestamps
    end
  end
end
