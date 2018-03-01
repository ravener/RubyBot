require 'discordrb'

token = File.open("token.txt")
token = token.read

bot = Discordrb::Commands::CommandBot.new token: token, prefix: 'r.'

bot.command(:eval, help_available: false) do |event, *code|
  break unless event.user.id == 292690616285134850

  begin
    "```rb\n#{eval code.join(' ')}```"
  rescue => e
    "An error occurred\n```#{e}```"
  end
end

bot.command(:say, description:"Bot repeats what you say.") do |event, *msg|
  msg.join(" ")
end

bot.command(:ping, description:"Pong! Bot latency check.") do |event|
  msg = event.respond "Pong!"
  msg.edit "Pong! Time taken #{Time.now - event.timestamp} ms"
 end
 
bot.command(:shutdown, help_available: false) do |event|
  break unless event.user.id == 292690616285134850

  bot.send_message(event.channel.id, 'Bot is shutting down...')
  exit
end

bot.mention do |event|
  bot.send_message(event.channel.id, "Prefix is `r.`")
end

bot.command(:exec, help_available: false) do |event, *code|
 break unless event.user.id == 292690616285134850
 
 begin
  "```#{exec(code.join(' '))}```"
 rescue => e
  "```#{e}```"
 end
end

# Two extra commands i like, is so i can also run
# Python and NodeJS code straight from Ruby!
# The way this works is that we store the code entered
# in a file then use the exec method to run it and send
# back the results, this will also require you to have
# python or nodejs installed on your computer/vps.
bot.command(:python, help_available: false) do |event, *code|
 break unless event.user.id == 292690616285134850
 File.open("python.py", "w") { |f|
 	f.puts code.join(' ')
 }
  begin
  "```py\n#{exec 'python python.py'}```"
  rescue => e
  "```#{e}```"
 end
end
 
bot.command(:node, help_available: false) do |event, *code|
 break unless event.user.id == 292690616285134850
 File.open("node.js", "w") { |f|
 	f.puts code.join(' ')
 }
  begin
  "```py\n#{exec 'node node.js'}```"
  rescue => e
  "```#{e}```"
 end
end

bot.command(:eightball, description:"Ask the magic 8ball a question") do |event, *question|
Responses = [
   'It is certain',
   'It is decidedly so',
   'without a doubt',
   'Yes definitely',
   'You may rely on it',
   'As I see it, Yes',
   'Most likely',
   'Outlook good',
   'Yes',
   'Signs point to yes',
   'Reply hazy try again',
   'Ask again later',
   'Better not tell you now',
   'Cannot predict now',
   'Concentrate and ask again',
   'Dont count on it',
   'My reply is no',
   'My sources say no',
   'Outlook not so good',
   'Very doubtful'
]
 bot.send_message(event.channel.id, Responses[rand(0..Responses.length)])
 return nil
end

bot.command(:invite, description:"Want me in your server?") do |event|
 "https://discordapp.com/api/oauth2/authorize?client_id=418832859927805972&permissions=1544023287&scope=bot"
end

bot.run