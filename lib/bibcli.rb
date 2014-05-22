require "bibcli/version"

def require_all(path)
  glob = File.join(File.dirname(__FILE__), path, '*.rb')
  Dir[glob].each do |f|
    require f
  end
end

require_all 'bibcli'
require_all 'bibcli/commands'

module Bibcli
  class Interface
    @@homefile = ENV['HOME'] + '/.bibcli/user.db'
    attr_reader :homefile

    def self.parse(args)
      self.initialize

      if args.length == 0
        self.usage
        return
      end
      cmd = args[0]
      args = args[1,args.length]
      if cmd == "add"
        Bibcli::Commands::Add.process(args)
      elsif cmd == "generate"
        Bibcli::Commands::Generate.process(args)
      elsif cmd == "show"
        Bibcli::Commands::Show.process(args)
      else
        puts "ERROR: Unrecognized command: '#{cmd}'"
      end
    end

    def self.initialize
      dir = ENV['HOME'] + '/.bibcli'
      `mkdir -p #{dir}`
      unless File.exist?(@@homefile)
        open(@@homefile,'w') { |file|
          file.write("{\n}")
        }
      end
    end

    def self.usage
      puts "bibcli: usage"
    end

  end
end
