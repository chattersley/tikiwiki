<?php

// $Header: /cvsroot-fuse/tikiwiki/tiki/tiki-minical_reminders.php,v 1.9.2.2 2006/08/04 22:53:37 luciash Exp $

// Copyright (c) 2002-2005, Luis Argerich, Garland Foster, Eduardo Polidor, et. al.
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.
include_once("lib/init/initlib.php");
include_once ('tiki-setup_base.php');

include_once ('lib/minical/minicallib.php');

if (!$minical_reminders)
	die;

//$refresh=$_REQUEST['refresh']*1000;
$refresh = 1000 * 60 * 1;
$evs = $minicallib->minical_get_events_to_remind($user, $minical_reminders);

foreach ($evs as $ev) {
	$command = "<script type='text/javascript'>alert('event " . $ev['title'] . " will start at " . date(
		"h:i", $ev['start']). "');</script>";

	print ($command);
	$minicallib->minical_event_reminded($user, $ev['eventId']);
}

?>

<?php

print ('<body onload="window.setInterval(\'location.reload()\',' . $refresh . ');">');

?>
