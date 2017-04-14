<?php

// $Header: /cvsroot-fuse/tikiwiki/tiki/banner_image.php,v 1.8.2.5 2005/08/22 08:00:53 telenieko Exp $

// Copyright (c) 2002-2005, Luis Argerich, Garland Foster, Eduardo Polidor, et. al.
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.

# $Header: /cvsroot-fuse/tikiwiki/tiki/banner_image.php,v 1.8.2.5 2005/08/22 08:00:53 telenieko Exp $

// application to display an image from the database with 
// option to resize the image dynamically creating a thumbnail on the fly.
if (!isset($_REQUEST["id"])) {
	die;
}

include_once("lib/init/initlib.php");
include_once ('db/tiki-db.php');

$bannercachefile = "temp";
if ($tikidomain) { $bannercachefile.= "/$tikidomain"; }
$bannercachefile.= "/banner.".$_REQUEST["id"];

if (is_file($bannercachefile) and (!isset($_REQUEST["reload"]))) {
	$size = getimagesize($bannercachefile);
	$type = $size['mime'];
} else {
	include_once ('lib/tikilib.php');
	$tikilib = new Tikilib($dbTiki);
	include_once ('lib/banners/bannerlib.php');
	if (!isset($bannerlib)) {
		$bannerlib = new BannerLib($dbTiki);
	}
	$data = $bannerlib->get_banner($_REQUEST["id"]);
	$type = $data["imageType"];
	$data = $data["imageData"];
	if ($data) {
		$fp = fopen($bannercachefile,"wb");
		fputs($fp,$data);
		fclose($fp);
	}
}

header ("Content-type: $type");
if (is_file($bannercachefile)) {
	readfile($bannercachefile);
} else {
	echo $data;
}

?>
