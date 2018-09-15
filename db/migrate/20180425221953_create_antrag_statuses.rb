class CreateAntragStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :antrag_statuses do |t|
      t.string :name
      t.string :beschreibung

      t.timestamps
    end
  end
end
