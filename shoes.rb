Shoes.setup do
  gem 'twitter'
end

require 'twitter'

Shoes.app(:title => "Feather", :width => 480, :height =>480, :resizable => false) do
  background "#fff"
  @timeline = Twitter.user_timeline("strongjoe")
  stack(:width => 75) do
	background "#222"
    para "menu"
  end
  stack(:width => 405) do
    @timeline.each do |tweet|
	  stack do
	    background "#aaa".."#bbb"
        flow do
		  image tweet.user.profile_image_url
          para tweet.user.name
          para tweet.text
        end
	  end
    end
  end
end