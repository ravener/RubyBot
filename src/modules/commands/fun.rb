require 'discordrb'

module Bot::Commands
  module Fun
    extend Discordrb::Commands::CommandContainer
      command(:eightball, description:"Ask the magic 8ball a question") do |event|
        event.respond [
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
        ].sample
      end

     command(:say, description:"Bot repeats what you say") do |event, *msg|
       begin
         event.message.delete
       rescue => e
        puts e
       end
       event.respond msg.join(' ')
     end
  end
end
