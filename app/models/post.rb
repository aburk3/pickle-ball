class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, :length => {:within => 5..50}, on: :create
  validates :content, presence: true, :length => {:within => 5..50}, on: :create
end
