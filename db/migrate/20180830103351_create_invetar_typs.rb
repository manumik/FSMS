class CreateInvetarTyps < ActiveRecord::Migration[5.1]
  def change
    create_table :invetar_typs do |t|
      t.string :name

      t.timestamps
    end
  end
end
