DATA = {
  :user_keys =>
    ["first_name", "last_name", "email", "password"],
  :users => [
    ["John", "Stoakes", "john@gmail.com", "password"],
    ["Max", "Million", "max@gmail.com" "password"],
    ["Mallory", "Burke", "killin@gmail.com", "password"],
    ["Jimmy", "Neutron", "jimmy@gmail.com", "password"],
    ["Emily", "Pan", "Dave@gmail.com", "password"],
    ["James", "Span", "James@gmail.com", "password"],
    ["Hulk", "Jr", "April@gmail.com", "password"],
  ],
  :club_keys =>
   ["name", "club_category", "description"],
  :clubs => [
    ["Maceys with Wine", "Winee", "This is a Club that is all about wine!"],
    ["Philosophy Club", "Philosophy", "We talk about the most important ideas that philsophers over the ages have pondered."],
    ["Soccer Club", "Sports", "We will play tons of soccer at least 2 days per week."],
  ]
}

def main
  make_users
  make_clubs
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_clubs
  DATA[:clubs].each do |club|
    new_club = Club.new
    club.each_with_index do |attribute, i|
      new_club.send(DATA[:club_keys][i] + "=", attribute)
    end
    new_club.users.each {|c| c.save}
    new_club.save
  end
end

main
