<?php

// $Header: /cvsroot-fuse/tikiwiki/tiki/lib/minical/index.php,v 1.3.2.1 2005/01/01 00:12:46 damosoft Exp $

// Copyright (c) 2002-2005, Luis Argerich, Garland Foster, Eduardo Polidor, et. al.
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.

// This redirects to the sites root to prevent directory browsing

header ("location: ../index.php");
die;

?>
