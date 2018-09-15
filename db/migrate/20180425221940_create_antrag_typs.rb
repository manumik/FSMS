class CreateAntragTyps < ActiveRecord::Migration[5.1]
  def change
    create_table :antrag_typs do |t|
      t.string :name
      t.string :beschreibung

      t.timestamps
    end
  end
end
