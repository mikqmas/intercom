class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :body, limit: 120
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
