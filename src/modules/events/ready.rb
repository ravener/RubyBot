require 'discordrb'

module Bot::Events
 module Ready
  extend Discordrb::EventContainer
   puts "Bot is online!"
   sleep 3
   Bot::BOT.game = "r.help | #{Bot::BOT.servers.size} servers!"
 end
end