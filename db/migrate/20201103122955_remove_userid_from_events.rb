class RemoveUseridFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :user_id, :integer
  end
end
