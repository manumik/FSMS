class CreateSoftwarerechtes < ActiveRecord::Migration[5.1]
  def change
    create_table :softwarerechtes do |t|
      t.string :name
      t.string :beschreibung
      t.boolean :kasse_neuerKunde
      t.boolean :kasse_bezahlen
      t.boolean :kasse_ausgeben
      t.boolean :dreamspark_aufnehmen
      t.boolean :dreamspark_editiren
      t.boolean :drucken
      t.boolean :ausleihen_algemein
      t.boolean :ausleihen_laptop
      t.boolean :antrag_New
      t.boolean :antrag_Show
      t.boolean :antrag_delete
      t.boolean :antrag_edit
      t.boolean :antragtyp
      t.boolean :antragStatus
      t.boolean :datein_New
      t.boolean :datein_Show
      t.boolean :datein_delete
      t.boolean :datein_edit
      t.string :dateienKatigorie
      t.boolean :modul
      t.boolean :professor
      t.boolean :studiengang
      t.boolean :invetar_New
      t.boolean :invetar_Show
      t.boolean :invetar_delete
      t.boolean :invetar_edit
      t.boolean :member_New
      t.boolean :member_Show
      t.boolean :member_delete
      t.boolean :member_edit
      t.boolean :order_New
      t.boolean :order_Show
      t.boolean :order_delete
      t.boolean :order_edit
      t.boolean :orderStatus
      t.boolean :softwarerechte

      t.timestamps
    end
  end
end
