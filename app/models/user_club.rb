class UserClub < ActiveRecord::Base
  belongs_to :user
  belongs_to :club
end
