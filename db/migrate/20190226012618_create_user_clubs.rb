class CreateUserClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_clubs do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :club, index: true, foreign_key: true
      t.boolean :favorite_club
      t.timestamps null: false
    end
  end
end
