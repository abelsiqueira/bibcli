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

      def generate_key(entry)
        require 'i18n'
        #bib:LastNameYearTitle
        lastname = entry["author"].split(',')[0]
        lastname.gsub!('ç','cc')
        lastname = I18n.transliterate(lastname.downcase)
        year = entry["year"]
        title = entry["title"].split(/[^[:alnum:]]/).select{|x|x.length>3}[0]
        title = I18n.transliterate(title.downcase)
        lastname + year + title
      end

    end

  end
end
