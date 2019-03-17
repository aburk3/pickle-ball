class CreateClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :description
      t.string :state
      t.string :city
      t.string :contact
      t.integer :club_admin
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
