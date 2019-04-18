class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def next
    post = Post.where("id > ?", id).first

    if post
      post
    else
      Post.first
    end
  end
end
