# bibcli

This is a command line interface to manage references in the format of bibtex
and json.
Our objectives are

- read from/to bibtex to/from json;
- use a machine global database (in json?) to keep all user wanted references;
- generate a local bib file from the global file by reading the tex requirements;
- set a naming convention for references;
- estabilish a user reviewed global repository of references;
- sync with a remote global repository for all validated references;
- manually add a reference.

## License

This work is licensed under GPL v3.0. See LICENSE.

## Install

You will need ruby and gems. Obtain them however you want.

Now you need 'bibtex-ruby' and 'json'

    $ gem install bibtex-ruby
    $ gem install json

Now build and install

    $ gem build bibcli.gemspec
    $ gem install bibcli-x.y.z.gem

## Using

The first thing you want to do is provide a initial database, if you have one.
To add a file `mybib.bib` to the database, use

    $ bibcli add mybib.bib

To generate a local bib file from a tex file mywork.tex, use

    $ bibcli generate mywork.tex > mywork.bib

Other uses will appear soon.
