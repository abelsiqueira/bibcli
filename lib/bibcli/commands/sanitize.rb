module Bibcli
  module Commands
    class Sanitize < Command

      class << self

        def process(args)
          if args.empty?
            sanitize_home
          else
            raise "ERROR: not expecting arguments"
          end
        end

        def sanitize_home
          homebib = Parser.opendb(Bibcli::Interface.homefile)

          homebib = homebib.map { |type, content|
            [type, content.map { |key, entry|
              [Parser.generate_key(entry), entry]
            }.to_h]
          }.to_h

          open(Bibcli::Interface.homefile, 'w') { |file|
            file.write(JSON.pretty_generate(homebib))
          }
        end

      end

    end
  end
end
