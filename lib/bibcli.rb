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

    def self.parse(args)
      if args.length == 0
        self.usage
        return
      end
      cmd = args[0]
      args = args[1,args.length]
      if cmd == "add"
        Bibcli::Commands::Add.process(args)
      elsif cmd == "show"
        Bibcli::Commands::Show.process(args)
      else
        puts "ERROR: Unrecognized command: '#{cmd}'"
      end
    end

    def self.usage
      puts "bibcli: usage"
    end

    def self.homefile
      @@homefile
    end

  end
end
