class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :state
      t.string :city
      t.datetime :tournament_datetime
      t.string :description
      t.string :events
      t.integer :director

      t.timestamps
    end
  end
end
