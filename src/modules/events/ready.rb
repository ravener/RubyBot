require 'discordrb'

module Bot::Events
 module Ready
  extend Discordrb::EventContainer
   puts "Bot is online!"
   event.bot.game = "r.help | #{event.bot.servers.size} servers"
 end
end