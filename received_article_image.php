<?php

// $Header: /cvsroot-fuse/tikiwiki/tiki/received_article_image.php,v 1.6.2.1 2005/01/01 00:11:21 damosoft Exp $

// Copyright (c) 2002-2005, Luis Argerich, Garland Foster, Eduardo Polidor, et. al.
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.

# $Header: /cvsroot-fuse/tikiwiki/tiki/received_article_image.php,v 1.6.2.1 2005/01/01 00:11:21 damosoft Exp $
// application to display an image from the database with 
// option to resize the image dynamically creating a thumbnail on the fly.
if (!isset($_REQUEST["id"])) {
	die;
}

include_once("lib/init/initlib.php");
include_once ('db/tiki-db.php');
include_once ('lib/tikilib.php');
$tikilib = new Tikilib($dbTiki);
include_once ('lib/commcenter/commlib.php');
$data = $commlib->get_received_article($_REQUEST["id"]);
$type = $data["image_type"];
$data = $data["image_data"];
header ("Content-type: $type");
echo $data;

?>
