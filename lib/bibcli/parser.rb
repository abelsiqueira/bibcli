require 'bibtex'
require 'json'

module Bibcli
  module Parser

    def self.openbib(filename)
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

    def self.opendb(filename)
      open(filename) { |file|
        JSON.load(file)
      }
    end

  end
end
