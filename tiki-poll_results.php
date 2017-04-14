<?php

// $Header: /cvsroot-fuse/tikiwiki/tiki/tiki-poll_results.php,v 1.12.2.4 2005/01/01 00:11:26 damosoft Exp $

// Copyright (c) 2002-2005, Luis Argerich, Garland Foster, Eduardo Polidor, et. al.
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.

// Initialization
require_once ('tiki-setup.php');

include_once ('lib/polls/polllib.php');

if (!isset($polllib)) {
	$polllib = new PollLib($dbTiki);
}

if ($feature_polls != 'y') {
	$smarty->assign('msg', tra("This feature is disabled").": feature_polls");

	$smarty->display("error.tpl");
	die;
}

if (!isset($_REQUEST["pollId"])) {
	$smarty->assign('msg', tra("No poll indicated"));

	$smarty->display("error.tpl");
	die;
}

$poll_info = $polllib->get_poll($_REQUEST["pollId"]);
$polls = $polllib->list_active_polls(0, -1, 'publishDate_desc', '');
$options = $polllib->list_poll_options($_REQUEST["pollId"]);

$temp_max = count($options);
for ($i = 0; $i < $temp_max; $i++) {
	if ($poll_info["votes"] == 0) {
		$percent = 0;
	} else {
		$percent = number_format($options[$i]["votes"] * 100 / $poll_info["votes"], 2);

		$options[$i]["percent"] = $percent;
	}

	$width = $percent * 200 / 100;
	$options[$i]["width"] = $percent;
}

// Poll comments
if ($feature_poll_comments == 'y') {
	$comments_per_page = $poll_comments_per_page;

	$comments_default_ordering = $poll_comments_default_ordering;
	$comments_vars = array('pollId');
	$comments_prefix_var = 'poll:';
	$comments_object_var = 'pollId';
	include_once ("comments.php");
}

$smarty->assign_by_ref('poll_info', $poll_info);
$smarty->assign('title', $poll_info['title']);
$smarty->assign_by_ref('polls', $polls["data"]);
$smarty->assign_by_ref('options', $options);

ask_ticket('poll-results');

// Display the template
$smarty->assign('mid', 'tiki-poll_results.tpl');
$smarty->display("tiki.tpl");

?>
