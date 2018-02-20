class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name, limit: 30
      t.string :description, limit:100
      t.references :merchant

      t.timestamps
    end
    add_index :groups, :name
  end
end
