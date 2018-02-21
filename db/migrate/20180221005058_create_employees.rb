class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :uuid, limit: 20, unique: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
