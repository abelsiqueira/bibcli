module Bibcli
  module Commands
    class Show < Command

      class << self

        def process(args)
          if args.length == 0
            puts JSON.pretty_generate(Bibcli::Parser.opendb(Bibcli::Interface.homefile))
          else
            if File.exist?(args[0])
              puts JSON.pretty_generate(Bibcli::Parser.openbib(args[0]))
            else
              homebib = Bibcli::Parser.opendb(Bibcli::Interface.homefile)
              if homebib[args[0].to_s]
                puts JSON.pretty_generate(homebib[args[0].to_s])
              else
                puts "ERROR: No key or file '#{args[0]}'"
              end
            end
          end
        end

      end

    end
  end
end
