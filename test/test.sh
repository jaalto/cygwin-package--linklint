#!/bin/sh
# Test basic functionality

set -e

proram=$0
TMPDIR=${TMPDIR:-/tmp}
TMPBASE=${TMPDIR%/}tmp.$$
CURDIR=.

case "$0" in
  */*)
        CURDIR=$(cd "${0%/*}" && pwd)
        ;;
esac

AtExit ()
{
    rm -f "$TMPBASE"*
}

Run ()
{
    echo "$*"
    shift
    eval "$@"
}

trap AtExit 0 1 2 3 15

# #######################################################################

cd "$CURDIR/html" &&
Run "%% TEST local recursive:" linklint /@

# linklint does return sensible status code
exit 0

# End of file
