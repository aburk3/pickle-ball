class AddUrlToTournaments < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :url, :string
  end
end
