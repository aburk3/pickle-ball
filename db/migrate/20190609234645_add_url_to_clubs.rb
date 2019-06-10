class AddUrlToClubs < ActiveRecord::Migration[5.2]
  def change
    add_column :clubs, :url, :string
  end
end
