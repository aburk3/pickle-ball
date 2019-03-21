class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_posts, :id => false do |t|
      t.references :categories
      t.references :posts
    end
  end
end
