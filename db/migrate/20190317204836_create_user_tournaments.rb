class CreateUserTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tournaments do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :tournament, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
