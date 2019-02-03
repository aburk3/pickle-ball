class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :state
      t.boolean :moderator
      t.boolean :player
      t.boolean :tournament_director
      t.boolean :trainer
      t.integer :tier

      t.timestamps
    end
  end
end
