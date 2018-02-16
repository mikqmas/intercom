class CreateEmployeesGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :employees_groups do |t|

      t.timestamps
    end
  end
end
