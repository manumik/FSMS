class ChangeBibAtMember < ActiveRecord::Migration[5.1]
  def change
    change_column :members, :bib, :integer, limit: 8
  end
end
