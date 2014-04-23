#!/usr/bin/ruby -w

require 'bibtex'
require 'json'

def open_bib(filename)
  bib = BibTeX.open(filename)

  json = {}
  bib.each { |entry|
    json[entry.key] = {}
    entry.each { |key,value|
      json[entry.key][key] = value.to_s
    }
  }
  json
end

def print_json(json)
  puts JSON.pretty_generate(json)
end

def write_json(filename, json)
  open(filename, 'w') { |file|
    file.write(JSON.pretty_generate(json))
  }
end

json = open_bib('db/test.bib')
write_json('db/test.db', json)
