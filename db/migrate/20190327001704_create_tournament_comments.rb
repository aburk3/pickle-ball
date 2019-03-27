class CreateTournamentComments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournament_comments do |t|
      t.string :content
      t.belongs_to :user, foreign_key: true
      t.belongs_to :tournament, foreign_key: true

      t.timestamps
    end
  end
end
