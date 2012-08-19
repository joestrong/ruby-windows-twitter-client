Shoes.setup do
  gem 'twitter'
end

require 'twitter'

class Feather < Shoes
  url '/', :index
  url '/user', :user
  
  def index
    menu()
    stack(:width => 405) do
      background 'background.png'
      para "general timeline"
    end
  end
  
  def user
    @timeline = Twitter.user_timeline("strongjoe")
    menu()
    stack(:width => 405, :height => 480, :scroll => true) do
      background 'background.png'
      @timeline.each do |tweet|
	    stack do
          flow do
            image tweet.user.profile_image_url
            para tweet.user.name
            para tweet.text
          end
	    end
      end
    end
  end
  
  def menu
    stack(:width => 75, :height => 480) do
      background '#222'
      para "Menu"
	    para link("Home", :click => "/")
	    para link("User", :click => "/user")
    end
  end
  
end

Shoes.app :title => "Feather", :width => 480, :height => 480, :resizable => false