<?php

// $Header: /cvsroot-fuse/tikiwiki/tiki/tiki-download_userfile.php,v 1.6.2.2 2005/05/07 01:03:08 redflo Exp $

// Copyright (c) 2002-2005, Luis Argerich, Garland Foster, Eduardo Polidor, et. al.
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.

// Initialization
require_once ('tiki-setup.php');

include_once ('lib/userfiles/userfileslib.php');

if (!isset($_REQUEST["fileId"])) {
	die;
}

$uf_use_db = $tikilib->get_preference('uf_use_db', 'y');
$uf_use_dir = $tikilib->get_preference('uf_use_dir', '');

$info = $userfileslib->get_userfile($user, $_REQUEST["fileId"]);
$type = &$info["filetype"];
$file = &$info["filename"];
$content = &$info["data"];

session_write_close();
header ("Content-type: $type");
header ("Content-Disposition: inline; filename=\"$file\"");

if ($info["path"]) {
	readfile ($uf_use_dir . $info["path"]);
} else {
	echo "$content";
}

?>
