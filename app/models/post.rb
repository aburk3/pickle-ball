class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, :length => {:within => 5..100}, on: :create
  validates :content, presence: true, :length => {:within => 5..500}, on: :create
end
