require 'bibcli/command'
require 'bibcli/parser'
require 'bibcli/commands/add'

module Bibcli
  class Interface
    @@homefile = ENV['HOME'] + '/.bibcli/user.db'
    def self.parse(args)
      cmd = args[0]
      if cmd == "add"
        Bibcli::Commands::Add.process(args[1,args.length])
      else
        puts "ERROR: Unrecognized command: '#{cmd}'"
      end
    end

    def self.homefile
      @@homefile
    end
  end
end
