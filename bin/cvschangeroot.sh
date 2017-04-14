#!/bin/sh
# $Id: cvschangeroot.sh,v 1.2.2.1 2006/06/09 22:34:23 marclaporte Exp $

if [ "$1" = "" ]; then
	echo "Usage:   $0 CVSROOT"
	echo "Example: $0 :ext:${USER}@tikiwiki.cvs.sourceforge.net:/cvsroot/tikiwiki"
	exit 1
fi

TMP=/tmp/`basename $0`.$$.tmp
echo echo \$2 \>\$1 >$TMP
chmod +x $TMP

find . -name 'Root' -exec $TMP {} $1 \;
rm -f $TMP
