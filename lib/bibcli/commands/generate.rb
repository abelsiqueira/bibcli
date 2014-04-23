module Bibcli
  module Commands
    class Generate < Command

      class << self

        def process(args)
          if args.length == 0
            puts "ERROR: generate needs a .tex argument"
            return
          end

          filename = args[0]
          if File.exist?(filename)
            src = File.open(filename).read().scan(/cite{([^}]+)}/)
            refs = []
            src.each { |x|
              x[0].split(',').each { |a| refs << a.strip }
            }

            homebib = Bibcli::Parser.opendb(Bibcli::Interface.homefile)
            refs.each { |key|
              homebib.each { |type,info|
                if homebib[type][key]
                  puts "@#{type}{#{key},"
                  output = []
                  info[key].each { |k,v|
                    output << "  #{k} = \"#{v}\""
                  }
                  puts output.join(",\n")
                  puts "}\n\n"
                end
              }
            }
          end
        end

      end

    end
  end
end
