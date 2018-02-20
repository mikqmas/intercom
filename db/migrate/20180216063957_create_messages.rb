class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :body, limit:140
      t.string :to_id, limit:20
      t.string :from_id, limit:20
      t.references :group
      t.references :merchant

      t.timestamps
    end
    add_index :messages, :to_id
    add_index :messages, :from_id
  end
end
