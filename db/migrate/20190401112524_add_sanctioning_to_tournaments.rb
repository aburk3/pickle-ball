class AddSanctioningToTournaments < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :status, :string
  end
end
