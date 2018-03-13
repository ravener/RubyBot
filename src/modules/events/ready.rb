require 'discordrb'

module Bot::Events
 module Ready
  extend Discordrb::EventContainer
   puts "Bot is online!"
  
 end
end