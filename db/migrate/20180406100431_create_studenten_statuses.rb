class CreateStudentenStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :studenten_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
