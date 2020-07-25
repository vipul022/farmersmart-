class WelcomeController < ApplicationController
  def index
  p"----------@@@@@"
  if user_signed_in?
  p current_user
  end
  end
end
#<User id: 4, email: "surbhi@test.com", created_at: "2020-07-24 07:43:30", updated_at: "2020-07-24 07:43:30", first_name: nil, last_name: nil, bio: nil, profile_pic: nil>