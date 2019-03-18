# grep -- Print lines matching a pattern
{:data-section="shell"}
{:data-date="September 26, 2017"}
{:data-extra="Um Pages"}
{::comment}
^ The Kramdown "attribute list" which provides metadata for the page.
The first heading must include the name of the command and a summary.
{:/}

## SYNOPSIS
{::comment}Top level Markdown headings become man section headings.{:/}
**grep** [OPTIONS...] *pattern* [FILE...]

## REGEX SYNTAX
{::comment}Here we're using a "definition list" to get that man page look.{:/}

`.`
: Matches any character.

`^`
: Anchors pattern to beginning of line.

`$`
: Anchors pattern to end of line.

`[]`
: Character set. ^ for negation, - for range.

## OPTIONS
`-r`
: Recursively search listed directories.

`-E`
: Force grep to behave as egrep, accepting extended REGEXes.
