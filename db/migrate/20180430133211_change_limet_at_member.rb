class ChangeLimetAtMember < ActiveRecord::Migration[5.1]
  def change
      change_column :members, :tel, :integer, limit: 8
      change_column :members, :chipid, :string
  end
end
