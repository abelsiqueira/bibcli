module Bibcli
  class Pretty
    class << self

      def print(bib)
        bib.each { |type,content|
          puts content.map { |key,entry|
            "> #{key} - #{type}\n" +
            "  \"#{entry["title"]}\"\n" +
            "  by \"#{entry["author"]}\"\n" +
            "  on \"#{entry["journal"]}\"\n" +
            "  #{entry["year"]}, v.#{entry["volume"]}, #{entry["number"]}, #{entry["pages"]}\n"
          }.join("\n")
        }
      end

    end
  end
end
