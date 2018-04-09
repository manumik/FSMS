class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.integer :bibnummer
      t.string :surname
      t.string :name
      t.string :tel
      t.string :email
      t.integer :percentage
      t.integer :studiengang
      t.integer :kundenstatus
      t.timestamp :ersteinschreibung

      t.timestamps
    end
  end
end
