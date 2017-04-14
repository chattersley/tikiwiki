<?php
// $Header: /cvsroot-fuse/tikiwiki/tiki/tiki-blogs_rss.php,v 1.26.2.7 2005/04/23 23:30:31 ohertel Exp $

// Copyright (c) 2002-2005, Luis Argerich, Garland Foster, Eduardo Polidor, et. al.
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.

require_once ('tiki-setup.php');
require_once ('lib/tikilib.php');
require_once ('lib/blogs/bloglib.php');
require_once ('lib/rss/rsslib.php');

if ($rss_blogs != 'y') {
        $errmsg=tra("rss feed disabled");
        require_once ('tiki-rss_error.php');
}

if ($tiki_p_read_blog != 'y') {
        $errmsg=tra("Permission denied you cannot view this section");
        require_once ('tiki-rss_error.php');
}

$feed = "blogs";
$title =  (!empty($title_rss_blogs)) ? $title_rss_blogs : tra("Tiki RSS feed for weblogs");
$desc =  (!empty($desc_rss_blogs)) ? $desc_rss_blogs : tra("Last posts to weblogs.");
$now = date("U");
$id = "blogId";
$descId = "data";
$dateId = "created";
$titleId = "title";
$authorId = "user";
$readrepl = "tiki-view_blog_post.php?$id=%s&postId=%s";
$uniqueid = $feed;

$tmp = $tikilib->get_preference('title_rss_'.$feed, '');
if ($tmp<>'') $title = $tmp;
$tmp = $tikilib->get_preference('desc_rss_'.$feed, '');
if ($desc<>'') $desc = $tmp;

$changes = $bloglib -> list_all_blog_posts(0, $max_rss_blogs, $dateId.'_desc', '', $now);
$tmp = array();
foreach ($changes["data"] as $data)  {
	$data["$descId"] = $tikilib->parse_data($data["$descId"]);
	$tmp[] = $data;
}
$changes["data"] = $tmp;
$tmp = null;
$output = $rsslib->generate_feed($feed, $uniqueid, '', $changes, $readrepl, 'postId', $id, $title, $titleId, $desc, $descId, $dateId, $authorId);

header("Content-type: ".$output["content-type"]);
print $output["data"];

?>
