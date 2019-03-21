class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :post_categories
  has_and_belongs_to_many :categories


  accepts_nested_attributes_for :categories

end
