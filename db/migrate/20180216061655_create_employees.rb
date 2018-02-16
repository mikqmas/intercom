class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :uuid
      t.string :name
      t.string :role
      t.boolean :isOwner

      t.timestamps
    end
    add_index :employees, :uuid, unique: true
    add_index :employees, :name
  end
end
