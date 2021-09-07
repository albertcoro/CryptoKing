<?php
   session_start();
   
   if(session_destroy()) {
      header("Location: login.php");
   }
?>
<html>
    <head>
		<title> Crypto King - Where your dreams begin </title>
		<link rel="stylesheet" href="style.css">
		<link rel="icon" type="image/x-icon" href="./media/favicon/favicon-32.png"/>
	</head>
<html>