class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :club
      t.string :state
      t.string :city
      t.float :utpr_d
      t.float :utpr_m
      t.float :utpr_s
      t.integer :member_num
      t.float :skill_d
      t.float :skill_s
      t.integer :score
      t.string :image
      t.string :uid
      t.boolean :admin
      t.boolean :trainer

      t.timestamps
    end
  end
end
