class CreateTexts < ActiveRecord::Migration[5.1]
  def change
    create_table :texts do |t|
      t.string :tag
      t.string :de
      t.string :en
      t.string :fr
      t.string :sp

      t.timestamps
    end
  end
end
