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

    class << self

      def parse(args)
        self.initialize

        if args.length == 0
          self.usage
          return
        end
        cmd = args[0]
        args = args[1,args.length]
        if Command.subclasses.select { |scmd|
          if cmd == scmd.to_s.split('::')[-1].downcase
            scmd.process(args)
            true
          else
            false
          end
        }.empty?
          puts "ERROR: Unrecognized command: '#{cmd}'"
        end
      end

      def initialize
        dir = ENV['HOME'] + '/.bibcli'
        `mkdir -p #{dir}`
        unless File.exist?(@@homefile)
          open(@@homefile,'w') { |file|
            file.write("{\n}")
          }
        end
      end

      def usage
        puts "BibCLI"
        puts "  Commands:"
        Command.subclasses.each { |cmd|
          puts "  - #{cmd.to_s.split('::')[-1].downcase}"
        }
      end

      def homefile
        @@homefile
      end

    end

  end
end
