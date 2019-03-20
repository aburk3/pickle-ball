class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :likes, :default => 0
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
