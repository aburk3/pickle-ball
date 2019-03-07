class Club < ActiveRecord::Base
  has_many :user_clubs, dependent: :destroy
  has_many :users, :through => :user_clubs
  has_many :meetings

  scope :open_clubs, -> { where(has_max: false) }

  validates :name, presence: true, :length => {:within => 5..30}, on: :create

  def is_admin?(user)
    self.admin == user.id
  end

  def reached_max
    if self.users.count == 5
      self.has_max = true
    end
  end

end
