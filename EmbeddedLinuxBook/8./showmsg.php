<html>
<h1>Messagebox</h1>

<?php
	$message=htmlspecialchars($_REQUEST["message"]);
	$clear = htmlspecialchars($_REQUEST["clear"]);

	#echo "<br>clear: ".$clear;
	#echo "<br>message: ".$message;

	if ($clear=="Standardmessage") {
		unlink("/tmp/message");
		echo "<h2>Standardnachricht wird angezeigt.</h2><br>\n";
	} else if ($message!="") {
		$datei=fopen( "/tmp/message","w" );
		fwrite($datei,$message,32);
		echo "<h2>Letzte Nachricht: ".$message."</h2><br>\n";
		fclose($datei);
	}
?>

<form action="showmsg.php" method="post">Neue Message:<br>
<input type="Text" name="message"><br>
<input type="Submit" value="Message anzeigen">
</form>

<form action="showmsg.php" method="post">
<input type="Submit" name="clear" value="Standardmessage">
</form>

</html>
