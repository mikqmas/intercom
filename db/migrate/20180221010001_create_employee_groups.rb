class CreateEmployeeGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_groups do |t|
      t.references :employee, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
