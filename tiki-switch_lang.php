<?php
require_once('tiki-setup.php');
include_once('lib/tikilib.php');

if (isset($_GET['from'])) 
	$orig_url = $_GET['from'];
elseif (isset($_SERVER['HTTP_REFERER']))
	$orig_url = $_SERVER['HTTP_REFERER'];
else
	$orig_url = $tikiIndex;
if (!preg_match('/(\?|&)bl=/', $orig_url)) {
	if (strstr($orig_url, 'tiki-index.php?'))
		$orig_url .= '&bl=y';
	else if (strstr($orig_url, 'tiki-index.php'))
		$orig_url .= '?bl=y';
}
if(isset($_GET['language'])) {
	$language = $_GET['language'];
	if($feature_userPreferences == 'y' && $user && $change_language == 'y')  {
		$tikilib->set_user_preference($user, 'language', $language);
	}
	else
		$_SESSION['language'] = $language;
	}

header("location: $orig_url");
exit;
?>
