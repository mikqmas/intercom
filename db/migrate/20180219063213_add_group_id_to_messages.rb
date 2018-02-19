class AddGroupIdToMessages < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :group
  end
end
