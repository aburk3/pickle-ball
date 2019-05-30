class CreateUpvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :upvotes do |t|
      t.references :comment, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
