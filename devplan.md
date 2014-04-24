# Development Plan

This should help me, and whoever else is interested, to find out what I mean and
want to do.

## Programming Language

I've chosen Ruby. Reasons:

- I want to learn more about it;
- It is (supposed to be) better at handling string/parsing problems.

## Files

### `$HOME/.bibclirc`

Configuration file for bibcli. Not sure what will be here yet.

### `$HOME/.bibcli/user.db`

Global machine database for the user required references.

## Tasks

There are many things to do:

- [ ] Write a decent development plan;
- [ ] Implement the minimum commands;
- [ ] Implement exception handling;
- [ ] Create a documentation;
- [ ] Create unit tests;


## Use

> [ ] `$ bibcli add CLASS`

> > Creates a new bibliography entry of type CLASS and add to database.

> [x] `$ bibcli add FILE`

> > Add all entries on bibtex FILE to the database.

> [x] `$ bibcli generate TEX`

> > Search for all cites on the TEX and prints a bibtex file using the
> > database to supply the entries.

> [x] `$ bibcli show`

> > Show the bibliography on the database on a pretty format.

> [x] `$ bibcli show FILE`

> > Show the bibliography on bibtex FILE on a pretty format.

> [x] `$ bibcli show CLASS`

> > Show all entries on the database from class CLASS.

> [ ] `$ bibcli search KEY VALUE`

> > Search in the database for the value VALUE in the keys KEY

> [ ] `$ bibcli remote ...`

> > Remote commands


