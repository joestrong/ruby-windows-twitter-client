Shoes.setup do
  gem 'twitter'
end

require 'twitter'

Shoes.app do
  @text = Twitter.user_timeline("strongjoe").first.text
  stack{
    para @text
  }
end