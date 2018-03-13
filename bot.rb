require 'discordrb'
require 'ostruct'
require 'yaml'

module Bot

  Dir['src/modules/*.rb'].each { |mod| load mod }
  CONFIG = OpenStruct.new YAML.load_file 'data/config.yaml'

  BOT = Discordrb::Commands::CommandBot.new token: CONFIG.token, prefix: 'r.'

  def self.load_modules(cls, path)
    new_module = Module.new
    const_set(cls.to_sym, new_module)
    Dir["modules/#{path}/*.rb"].each { |file| load file }
    new_module.constants.each do |mod|
      BOT.include! new_module.const_get(mod)
    end
  end

  load_modules(:Events, 'events')
  load_modules(:Commands, 'commands')


BOT.run

end