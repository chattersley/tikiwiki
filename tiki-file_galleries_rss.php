<?php
// $Header: /cvsroot-fuse/tikiwiki/tiki/tiki-file_galleries_rss.php,v 1.22.2.5 2005/04/23 23:30:31 ohertel Exp $

// Copyright (c) 2002-2005, Luis Argerich, Garland Foster, Eduardo Polidor, et. al.
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.

require_once ('tiki-setup.php');
require_once ('lib/tikilib.php');
require_once ('lib/rss/rsslib.php');

if ($rss_file_galleries != 'y') {
        $errmsg=tra("rss feed disabled");
        require_once ('tiki-rss_error.php');
}

if ($tiki_p_view_file_gallery != 'y') {
        $errmsg=tra("Permission denied you cannot view this section");
        require_once ('tiki-rss_error.php');
}

$feed = "filegals";
$title = (!empty($title_rss_file_galleries)) ? $title_rss_file_galleries : tra("Tiki RSS feed for file galleries");
$desc = (!empty($desc_rss_file_galleries)) ? $desc_rss_file_galleries : tra("Last files uploaded to the file galleries.");
$now = date("U");
$id = "fileId";
$descId = "description";
$dateId = "created";
$authorId = "user";
$titleId = "filename";
$readrepl = "tiki-download_file.php?$id=%s";
$uniqueid = $feed;

$tmp = $tikilib->get_preference('title_rss_'.$feed, '');
if ($tmp<>'') $title = $tmp;
$tmp = $tikilib->get_preference('desc_rss_'.$feed, '');
if ($desc<>'') $desc = $tmp;

$changes = $tikilib->list_files(0, $max_rss_file_galleries, $dateId.'_desc', '');
$output = $rsslib->generate_feed($feed, $uniqueid, '', $changes, $readrepl, '', $id, $title, $titleId, $desc, $descId, $dateId, $authorId);

header("Content-type: ".$output["content-type"]);
print $output["data"];

?>		
