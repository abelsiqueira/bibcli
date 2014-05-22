module Bibcli
  module Commands
    class Generate < Command

      class << self

        def process(args)
          if args.length == 0
            puts "ERROR: generate needs a .tex argument"
            return
          end

          refs = []
          args.each do |filename|
            if File.exist?(filename)
              src = File.open(filename).read().scan(/cite{([^}]+)}/)
              src.each { |x|
                x[0].split(',').each { |a| refs << a.strip }
              }
            end
          end

          refs.uniq!
          homebib = Bibcli::Parser.opendb(Bibcli::Interface.homefile)
          refs.each { |key|
            puts key
            homebib.each { |type,info|
              if homebib[type][key]
                puts "@#{type}{#{key},"
                output = []
                info[key].each { |k,v|
                  output << "  #{k} = \"#{v}\""
                }
                puts output.join(",\n")
                puts "}\n\n"
              else
                puts "ERROR: key \"#{key}\" not found."
              end
            }
          }
        end
      end

    end
  end
end
