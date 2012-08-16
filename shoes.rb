Shoes.setup do
  gem 'twitter'
end

require 'twitter'

Shoes.app do
  background "#fff".."#eee"
  border("#ccc", :strokewidth => 6)
  @timeline = Twitter.user_timeline("strongjoe")
  stack do
    @timeline.each do |tweet|
      flow do
        para tweet.from_user_id
        para tweet.text
      end
    end
  end
end