require 'discordrb'

module Bot::Commands
 module General
   extend Discordrb::Commands::CommandContainer
    command(:ping, description:"Pong! Bot latency check.") do |event|
     msg = event.respond "Pong!"
     msg.edit "Pong! Time taken #{Time.now - event.timestamp} ms"
  end
  command(:invite, description:"Want me in your server?") do |event|
   "https://discordapp.com/api/oauth2/authorize?client_id=418832859927805972&permissions=1544023287&scope=bot"
  end
 end
end