class AddGroupTypeToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :group_type, :string, limit: 50
    add_index :groups, :group_type
  end
end
