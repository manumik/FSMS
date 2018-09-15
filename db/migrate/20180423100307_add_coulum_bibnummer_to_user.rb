class AddCoulumBibnummerToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bibnummber, :integer
    add_column :users, :tel, :integer
    add_column :users, :studiengang, :string
    add_column :users, :softwarerechte, :integer
    add_column :users, :chipid, :integer
  end
end
