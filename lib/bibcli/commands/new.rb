module Bibcli
  module Commands
    class New < Command

      class << self

        def process(args)
          raise "ERROR: Need the bibliography TYPE" unless args.length > 0
          type = args[0].to_sym
          reqs = BibTeX::Entry::REQUIRED_FIELDS
          unless reqs.include?(type)
            raise "ERROR: type must be a valid bibliograph type"
          end
          puts "You have chosen to create a new #{type.capitalize}."
          puts "Provide the following information:"
          entry = reqs[type].zip(reqs[type].map { |field|
            print "  #{field.capitalize}: "
            STDIN.gets.chomp
          }).to_h
          entry[:type] = type
          while true
            puts "Optional information?"
            print "  Enter field (Empty to end): "
            field = STDIN.gets.chomp.downcase.to_sym
            break if field.empty?
            if entry.include?(field)
              raise "ERROR: Field already inserted"
            end
            print "  #{field.capitalize}: "
            entry[field] = STDIN.gets.chomp
          end

          add_entry(entry)
        end

        def add_entry(entry)
          bib = BibTeX::Entry.new(entry).parse_names
          homebib = Bibcli::Parser.opendb(Bibcli::Interface.homefile)

          #key = Bibcli::Parser.generate_key(bib)
          key = "teste"
          type = bib.type.to_s
          homebib[type] = {} unless homebib[type]
          homebib[type][key] = {} unless homebib[type][key]
          homebib[type].merge!({key=>bib.to_h})

          open(Bibcli::Interface.homefile, 'w') { |file|
            file.write(JSON.pretty_generate(homebib))
          }
        end

      end

    end
  end
end
