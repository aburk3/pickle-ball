class CreateClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :club_category
      t.string :description
      t.string :state
      t.string :city
      t.string :contact
      t.integer :admin
      t.boolean :has_max, default: false

      t.timestamps
    end
  end
end
