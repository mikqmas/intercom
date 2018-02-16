class CreateJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :employees, :groups do |t|
      t.integer :employee_id, index:true
      t.integer :group_id, index: true
      t.index [:group_id, :employee_id], name: 'group_employee_un', unique: true
    end
  end
end
