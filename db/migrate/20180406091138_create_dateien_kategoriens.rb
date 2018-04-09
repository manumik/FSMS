class CreateDateienKategoriens < ActiveRecord::Migration[5.1]
  def change
    create_table :dateien_kategoriens do |t|
      t.string :name

      t.timestamps
    end
  end
end
