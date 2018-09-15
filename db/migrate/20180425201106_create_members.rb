class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.integer :bib
      t.string :password_digest
      t.string :spitzname
      t.string :name
      t.string :surename
      t.string :email
      t.integer :tel
      t.integer :studengang
      t.integer :softwarerechte
      t.integer :chipid
      t.integer :getraenke

      t.timestamps
    end
  end
end
