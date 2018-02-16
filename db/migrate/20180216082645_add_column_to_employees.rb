class AddColumnToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :merchant_id, :string
    add_index :employees, :merchant_id
  end
end
