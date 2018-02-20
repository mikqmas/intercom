class CreateMerchants < ActiveRecord::Migration[5.1]
  def change
    create_table :merchants do |t|
      t.string :uuid, unique: true, limit: 20

      t.timestamps
    end
    add_index :merchants, :uuid, unique: true
  end
end
