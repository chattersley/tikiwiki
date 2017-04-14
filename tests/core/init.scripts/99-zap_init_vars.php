<?php
/**
 * \file
 * $Header: /cvsroot-fuse/tikiwiki/tiki/tests/core/init.scripts/Attic/99-zap_init_vars.php,v 1.2 2003/08/24 00:42:17 zaufi Exp $
 *
 * \brief Forget db info so that malicious PHP may not get password etc.
 */

$host_tiki = NULL;
$user_tiki = NULL;
$pass_tiki = NULL;
$dbs_tiki  = NULL;

unset($host_map);
unset($api_tiki);
unset($db_tiki);
unset($host_tiki);
unset($user_tiki);
unset($pass_tiki);
unset($dbs_tiki);

?>
