class User < ActiveRecord::Base
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :tournament_comments, dependent: :destroy
  has_many :likes, dependent: :delete_all
  has_many :upvotes, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_one_attached :image

  attr_accessor :remove_profile_image
  after_save :purge_profile_image, if: :remove_profile_image
  private def purge_profile_image
    image.purge_later
  end

  has_many :user_clubs
  has_many :clubs, :through => :user_clubs

  has_many :user_tournaments
  has_many :tournaments, :through => :user_tournaments

  validates :first_name, presence: true, on: :create
  validates :last_name, presence: true, on: :create
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  # validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, on: :create
  validates :password, presence: true, :length => {:within => 6..40}, on: :create
  validates :password, presence: true, :length => {:within => 6..40}, :allow_blank => true, on: :update

  before_save :downcase_fields

  def downcase_fields
    self.email.downcase!
  end

end
