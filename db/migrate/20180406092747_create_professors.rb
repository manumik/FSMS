class CreateProfessors < ActiveRecord::Migration[5.1]
  def change
    create_table :professors do |t|
      t.string :title
      t.string :surname
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
