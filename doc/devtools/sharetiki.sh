#!/bin/bash

# $Header: /cvsroot-fuse/tikiwiki/tiki/doc/devtools/sharetiki.sh,v 1.2.4.1 2005/10/02 12:57:31 mose Exp $
# that script prepares a dump of tiki for selective duplication
# tested on debian only for now
# 
# mose@tw.o

RHOST="tikiwiki.org"
RTIKI="/usr/local/tiki"
RTMPDIR="/tmp"
ARCHDIR="/usr/local/tiki/dupli"
VIRTUAL="tikiwiki.org"
OLDIR=`pwd`

eval `cat $RTIKI/db/$VIRTUAL/local.php | sed -e '/[\?#]/d' -e "s/\$\([-_a-z]*\)[[:space:]]*=[[:space:]]*\([-_a-zA-Z0-9\"'\.]*\);/\\1=\\2/"`
RDBHOST=${host_tiki:-'localhost'}
RDBNAME=${dbs_tiki:-'tikiwiki'}
RDBUSER=${user_tiki:-'root'}
RDBPASS=${pass_tiki:-''}

DATE=`date +%Y-%m-%d`
DUMP="tikiwiki.org.$DATE.sql"
DUMPLIGHT="tikiwiki.org_light.$DATE.sql"
cd $ARCHDIR

mysqldump -e -f --add-drop-table -h$RDBHOST -u$RDBUSER -p$RDBPASS $RDBNAME tiki_pages > $DUMPLIGHT
mysqldump -e -f --add-drop-table -h$RDBHOST -u$RDBUSER -p$RDBPASS $RDBNAME \
	tiki_articles \
	tiki_article_types \
	tiki_blog_posts \
	tiki_blogs \
	tiki_calendar_categories \
	tiki_calendar_items \
	tiki_calendar_locations \
	tiki_calendar_roles \
	tiki_calendars \
	tiki_categories \
	tiki_categorized_objects \
	tiki_category_objects \
	tiki_category_sites \
	tiki_comments \
	tiki_copyrights \
	tiki_directory_categories \
	tiki_directory_search \
	tiki_directory_sites \
	tiki_drawings \
	tiki_extwiki \
	tiki_faq_questions \
	tiki_faqs \
	tiki_forum_attachments \
	tiki_forums  \
	tiki_menus  \
	tiki_modules  \
	tiki_pages  \
	tiki_quicktags  \
	tiki_related_categories  \
	tiki_rss_feeds  \
	tiki_rss_modules  \
	tiki_structures  \
	tiki_topics  \
	tiki_wiki_attachments  \
	> $DUMP

bzip2 $DUMP
bzip2 $DUMPLIGHT

cd $OLDIR
echo "Done."

exit 0
