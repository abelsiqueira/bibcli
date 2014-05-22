module Bibcli
  module Commands
    class Add < Command

      class << self

        def process(args)
          if args[0] == "file"
            filename = args[1]
            bib = Bibcli::Parser.openbib(filename)
            homebib = Bibcli::Parser.opendb(Bibcli::Interface.homefile)

            bib.each { |key, value|
              key = key.to_s
              if homebib[key] == nil
                homebib[key] = value
              else
                homebib[key].merge!(value)
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
