class Addcolumngrouptable < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :description, :string, limit:140
  end
end
