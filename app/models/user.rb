class User < ActiveRecord::Base
  has_secure_password
  has_many :user_clubs
  has_many :clubs, :through => :user_clubs
  validates :first_name, presence: true, on: :create
  validates :last_name, presence: true, on: :create
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, on: :create
  validates :password, presence: true, :length => {:within => 6..40}, on: :create
  validates :password, presence: true, :length => {:within => 6..40}, on: :update

  before_save :downcase_fields

  def downcase_fields
    self.email.downcase!
  end

end
