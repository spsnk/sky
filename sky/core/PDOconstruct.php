<?php
if (!defined('NYA_INIT')) {
	header('HTTP/1.0 404 Not Found');
	include 'index.php';
	die;
}
require_once 'settings.php';
switch(NYA_INIT) {
	case 'WRITE': $u=$user; $p=$pass; break;
	default: $u=$readuser; $p=$readpass; break;
}
try {
	# MySQL with PDO_MYSQL
	$DBH = new PDO("mysql:host=$host;dbname=$db", $u, $p, array(
		PDO::ATTR_PERSISTENT => true,
		PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
		PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
	));
	//$DBH->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
	//$DBH->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_SILENT );
	//$DBH->setAttribute( PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC );
	//echo $DBH->getAttribute( PDO::ATTR_DEFAULT_FETCH_MODE);
	$DBH -> query("SET NAMES 'utf8'");
} catch(PDOException $e) {
	echo $e->getMessage();
	die("<br /><b>Application Terminated.</b>");
}
 // echo "<b>Connected to Database in ";
 // echo NYA_INIT;
 // echo " mode!</b><br />";
?>