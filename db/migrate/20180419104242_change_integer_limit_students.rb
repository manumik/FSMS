class ChangeIntegerLimitStudents < ActiveRecord::Migration[5.1]
  def change
    change_column :students, :bibnummer, :integer, limit: 8
  end
end
