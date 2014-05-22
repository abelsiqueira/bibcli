module Bibcli
  module Commands
    class Add < Command

      class << self

        def process(args)
          if args[0] == "file"
            filename = args[1]
            bib = Bibcli::Parser.openbib(filename)
            homebib = Bibcli::Parser.opendb(Bibcli::Interface.homefile)

            bib.each { |type, value|
              type = type.to_s
              if homebib[type] == nil
                homebib[type] = value
              else
                homebib[type].merge!(value)
              end
            }

            open(Bibcli::Interface.homefile, 'w') { |file|
              file.write(JSON.pretty_generate(homebib))
            }
          else
            raise "ERROR: command not found"
          end
        end

      end

    end
  end
end
