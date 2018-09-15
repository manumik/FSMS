class AddCollumToInvetarTyp < ActiveRecord::Migration[5.1]
  def change
    add_column :invetar_typs, :icon, :string
    add_column :datens, :besitzer, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
