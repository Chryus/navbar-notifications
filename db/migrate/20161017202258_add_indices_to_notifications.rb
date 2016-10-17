class AddIndicesToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_index :notifications, :recipient_id
    add_index :notifications, :actor_id
  end
end
