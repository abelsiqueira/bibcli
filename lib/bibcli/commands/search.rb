module Bibcli
  module Commands
    class Search < Command

      class << self

        def process(args)
          raise "ERROR: Needs argument for search" if args.empty?
          keyword = args[0]
          results = search(keyword)
          if results.empty?
            puts "No match for keyword '#{keyword}'"
          else
            puts JSON.pretty_generate(results)
          end
        end

        def search(keyword)
          homebib = Bibcli::Parser.opendb(Bibcli::Interface.homefile)
          results = {}
          homebib.each { |type,content|
            content.select { |key,entry|
              if entry.map { |k,v|
                  v.downcase.include?(keyword.downcase)
                  }.inject(false) { |r,t| r = r or t }
                results[type] = {} unless results[type]
                results[type][key] = entry
              end
            }
          }
          results
        end

      end

    end
  end
end
