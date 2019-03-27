class Tournament < ActiveRecord::Base
  has_many :user_tournaments, dependent: :destroy
  has_many :users, :through => :user_tournaments
  has_many :follows, dependent: :destroy
  has_many :tournament_comments, dependent: :destroy

  validates :name, presence: true, :length => {:within => 5..50}, on: :create

  def is_director?(user)
    self.director == user.id
  end

  def reached_max
    if self.users.count == 5
      self.has_max = true
    end
  end

end
