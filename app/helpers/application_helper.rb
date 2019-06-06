
module ApplicationHelper
  def us_states
    [
      ['-State-', '-State-'],
      ['AL', 'Alabama'],
      ['AK', 'Alaska'],
      ['AZ', 'Arizona'],
      ['AR', 'Arkansas'],
      ['CA', 'California'],
      ['CO', 'Colorado'],
      ['CT', 'Connecticut'],
      ['DE', 'Delaware'],
      ['DC', 'District of Columbia'],
      ['FL', 'Florida'],
      ['GA', 'Georgia'],
      ['HI', 'Hawaii'],
      ['ID', 'Idaho'],
      ['IL', 'Illinois'],
      ['IN', 'Indiana'],
      ['IA', 'Iowa'],
      ['KS', 'Kansas'],
      ['KY', 'Kentucky'],
      ['LA', 'Louisiana'],
      ['ME', 'Maine'],
      ['MD','Maryland'],
      [ 'MA','Massachusetts'],
      [ 'MI','Michigan'],
      [ 'MN','Minnesota'],
      [ 'MS','Mississippi'],
      [ 'MO','Missouri'],
      [ 'MT','Montana'],
      [ 'NE','Nebraska'],
      [ 'NV','Nevada'],
      [ 'NH','New Hampshire'],
      [ 'NJ','New Jersey'],
      [ 'NM','New Mexico'],
      [ 'NY','New York'],
      [ 'NC','North Carolina'],
      [ 'ND','North Dakota'],
      [ 'OH','Ohio'],
      [ 'OK','Oklahoma'],
      [ 'OR','Oregon'],
      [ 'PA','Pennsylvania'],
      [ 'PR','Puerto Rico'],
      [ 'RI','Rhode Island'],
      [ 'SC','South Carolina'],
      [ 'SD','South Dakota'],
      [ 'TN','Tennessee'],
      [ 'TX','Texas'],
      [ 'UT','Utah'],
      [ 'VT','Vermont'],
      [ 'VA','Virginia'],
      [ 'WA','Washington'],
      [ 'WV','West Virginia'],
      [ 'WI','Wisconsin'],
      [ 'WY','Wyoming']
    ]
  end

  def tournament_events
    [
      ['-Event-', '-Event-'],
      ['Doubles', 'MXDY'],
      ['Mixed Doubles', 'MXDY'],
      ['Singles', 'MXDY'],
      ['AR', 'MXDY'],
      ['CA', 'MXDY'],
      ['CO', 'MXDY'],
      ['CT', 'MXDY'],
      ['DE', 'MXDY'],
      ['DC', 'MXDY'],
      ['FL', 'MXDY'],
      ['GA', 'MXDY'],
      ['HI', 'MXDY'],
      ['ID', 'MXDY'],
      ['IL', 'MXDY'],
      ['IN', 'MXDY'],
      ['IA', 'MXDY'],
      ['KS', 'MXDY'],
      ['KY', 'MXDY'],
      ['LA', 'MXDY'],
      ['ME', 'MXDY'],
      ['MD','Maryland'],
      [ 'MA','Massachusetts'],
      [ 'MI','Michigan'],
      [ 'MN','Minnesota'],
      [ 'MS','Mississippi'],
      [ 'MO','Missouri'],
      [ 'MT','Montana'],
      [ 'NE','Nebraska'],
      [ 'NV','Nevada'],
      [ 'NH','New Hampshire'],
      [ 'NJ','New Jersey'],
      [ 'NM','New Mexico'],
      [ 'NY','New York'],
      [ 'NC','North Carolina'],
      [ 'ND','North Dakota'],
      [ 'OH','Ohio'],
      [ 'OK','Oklahoma'],
      [ 'OR','Oregon'],
      [ 'PA','Pennsylvania'],
      [ 'PR','Puerto Rico'],
      [ 'RI','Rhode Island'],
      [ 'SC','South Carolina'],
      [ 'SD','South Dakota'],
      [ 'TN','Tennessee'],
      [ 'TX','Texas'],
      [ 'UT','Utah'],
      [ 'VT','Vermont'],
      [ 'VA','Virginia'],
      [ 'WA','Washington'],
      [ 'WV','West Virginia'],
      [ 'WI','Wisconsin'],
      [ 'WY','Wyoming']
    ]
  end

  def find_club_admin(club)
    User.find_by_id(club.club_admin)
  end

  def find_td(tournament)
    User.find_by_id(tournament.director).first_name + " " + User.find_by_id(tournament.director).last_name
  end

  def score(user)
    likes = user.likes.count
    posts = user.posts.count * 4
    comments = total_comments(user) * 2
    clubs = user.clubs.count * 3
    likes + comments + posts + clubs
  end

  def total_comments(user)
    comments = (user.comments.count + user.tournament_comments.count)
    comments
  end

  def tab_selected(item)
    is_active = (item.count > 0) ? "active" : ''
  end

end
