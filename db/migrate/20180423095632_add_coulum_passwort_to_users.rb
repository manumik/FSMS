class AddCoulumPasswortToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :passwort_digest, :string
  end
end
