class AddEmployeeNameToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :employee_name, :string, limit:64
  end
end
