class CreateMerchants < ActiveRecord::Migration[5.1]
  def change
    create_table :merchants do |t|
      t.string :uuid
      t.string :name
      t.string :owner

      t.timestamps
    end
    add_index :merchants, :uuid, unique: true
    add_index :merchants, :name
  end
end
