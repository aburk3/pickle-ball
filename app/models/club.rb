class Club < ActiveRecord::Base
  has_many :user_clubs, dependent: :destroy
  has_many :users, :through => :user_clubs
  has_many :meetings, dependent: :delete_all

  scope :open_clubs, -> { where(status: true) }

  validates :name, presence: true, :length => {:within => 5..100}, on: :create

  def is_admin?(user)
    self.club_admin == user.id
  end

  def reached_max
    if self.users.count == 1000
      self.has_max = true
    end
  end

  def self.format_url(url)
    if !url.include?("http") && !url.include?("www")
      url.prepend("https://")
    elsif url.include?("www.")
      url.sub! 'www.', 'https://'
    end
  end

end
