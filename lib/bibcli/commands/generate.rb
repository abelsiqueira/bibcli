module Bibcli
  module Commands
    class Generate < Command

      class << self

        def process(args)
          if args.length == 0
            raise "ERROR: generate needs a .tex argument"
            return
          end

          args.each do |filename|
            if File.exist?(filename)
              refs = get_keys(File.open(filename).read())
              print_from_keys(refs)
            end
          end
        end

        def get_keys(text)
          refs = []
          src = text.scan(/cite[[:alpha:]*]*{([^}]+)}/)
          src.each { |x|
            x[0].split(',').each { |a| refs << a.strip }
          }
          refs.uniq
        end

        def print_from_keys(refs)
          homebib = Bibcli::Parser.opendb(Bibcli::Interface.homefile)
          refs.each { |key|
            output = []
            homebib.each { |type,info|
              if homebib[type][key]
                puts "@#{type}{#{key},"
                info[key].each { |k,v|
                  output << "  #{k} = \"#{v}\""
                }
              end
            }
            raise "ERROR: \"#{key}\" not found" if output.empty?
            puts output.join(",\n")
            puts "}\n\n"
          }
        end

      end

    end
  end
end
