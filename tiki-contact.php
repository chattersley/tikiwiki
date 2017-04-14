<?php

// $Header: /cvsroot-fuse/tikiwiki/tiki/tiki-contact.php,v 1.14.2.4 2006/01/28 13:18:51 ang23 Exp $

// Copyright (c) 2002-2005, Luis Argerich, Garland Foster, Eduardo Polidor, et. al.
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.

// Initialization
require_once ('tiki-setup.php');

include_once ('lib/messu/messulib.php');
include_once ('lib/userprefs/scrambleEmail.php');


if (!$user and $contact_anon != 'y') {
	$smarty->assign('msg', tra("You are not logged in"));

	$smarty->display("error.tpl");
	die;
}

if ($feature_contact != 'y') {
	$smarty->assign('msg', tra("This feature is disabled").": feature_contact");

	$smarty->display("error.tpl");
	die;
}

$smarty->assign('mid', 'tiki-contact.tpl');

$email = $userlib->get_admin_email();
$email = scrambleEmail($email,'strtr');

$smarty->assign('email', $email);

if ($user == '' and $contact_anon == 'y') {
  $user = 'anonymous';
	$smarty->assign('sent', 0);
	if (isset($_REQUEST['send'])) {
		check_ticket('contact');
		$smarty->assign('sent', 1);
		$message = '';
		// Validation:
		// must have a subject or body non-empty (or both)
		if (empty($_REQUEST['subject']) && empty($_REQUEST['body'])) {
			$smarty->assign('message', tra('ERROR: you must include a subject or a message at least'));
			$smarty->display("tiki.tpl");
			die;
		}
		$messulib->post_message($contact_user, $user, $_REQUEST['to'],
			'', $_REQUEST['subject'], $_REQUEST['body'], $_REQUEST['priority']);
		$message = tra('Message sent to'). ':' . $contact_user . '<br />';
		$smarty->assign('message', $message);
	}
}


if ($user and $feature_messages == 'y' and $tiki_p_messages == 'y') {
	$smarty->assign('sent', 0);

	if (isset($_REQUEST['send'])) {
		check_ticket('contact');
		$smarty->assign('sent', 1);

		$message = '';

		// Validation:
		// must have a subject or body non-empty (or both)
		if (empty($_REQUEST['subject']) && empty($_REQUEST['body'])) {
			$smarty->assign('message', tra('ERROR: Either the subject or body must be non-empty'));

			$smarty->display("tiki.tpl");
			die;
		}

		$message = tra('Message sent to'). ':' . $contact_user . '<br />';
		$messulib->post_message($contact_user, $user, $_REQUEST['to'],
			'', $_REQUEST['subject'], $_REQUEST['body'], $_REQUEST['priority']);

		$smarty->assign('message', $message);
	}
}

$smarty->assign('priority', 3);
ask_ticket('contact');

$smarty->display("tiki.tpl");

?>
