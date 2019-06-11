class AddDesktopNotificationsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :desktop_notifications, :boolean, :default => true
  end
end
