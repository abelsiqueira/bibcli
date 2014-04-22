#!/usr/bin/ruby -w

require 'bibtex'

bib = BibTeX.open('db/test.bib')

puts '{'
bib.each_with_index { |entry,index|
  puts '  "' + entry.key + '": {'
  array = Array.new
  entry.each { |key,value|
     array.push '    "' + key.to_s + '": "' + value.to_s + '"'
  }
  puts array.join(",\n")
  if index == bib.size-1
    puts '  }'
  else
    puts '  },'
    puts ''
  end
}
puts '}'
