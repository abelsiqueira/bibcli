require 'bibtex'
require 'json'

module Bibcli
  module Parser

    class << self

      def openbib(filename)
        raise "Need argument" unless filename
        bib = BibTeX.open(filename)

        json = {}
        bib.each { |entry|
          type = entry.type
          if json[type] == nil
            json[type] = {}
          end
          json[type][entry.key] = {}
          entry.each { |key,value|
            json[type][entry.key][key] = value.to_s
          }
        }
        json
      end

      def opendb(filename)
        raise "Need argument" unless filename
        open(filename) { |file|
          JSON.load(file)
        }
      end

    end

  end
end
