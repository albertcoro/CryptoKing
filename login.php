<?php
   include("configSQL.php");
   session_start();
   
   if($_SERVER["REQUEST_METHOD"] == "POST") {
      // username and password sent from form 
      
      $myusername = mysqli_real_escape_string($db,$_POST['username']);
      $mypassword = mysqli_real_escape_string($db,$_POST['password']); 

	  $hashNew = password_hash($mypassword, PASSWORD_DEFAULT);
      
      $sql = "SELECT psswd_en FROM userclient WHERE nickname = '$myusername'";
      $result = mysqli_query($db,$sql);
      $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
      $count = mysqli_num_rows($result);
	  $password = $row["psswd_en"];
      
      // If result matched $myusername and $mypassword, table row must be 1 row
		
      if($password == $mypassword) {
		$_SESSION['login_user'] = $myusername;
        header("location: home.php");
      }else {
         $error = "Your Login Name or Password is invalid";
		 echo '<script>alert("Incorrect Username or Password")</script>';
      }
   }
?>
<html>
	<head>
		<title> Crypto King </title>
		<link rel="stylesheet" href="style.css">
		<link rel="icon" type="image/x-icon" href="./media/favicon/favicon-32.png"/>
	</head>
	<body>
		<div class="login_layout">
			<div class="login_logo">
				<a href="index.html">
					<img src="media/Name.PNG" class="main_title"/>
				</a>
			</div>
			<div class="login_page">
				<form class="login_form" action="" method="post">
					<label for="fname">Username:</label><br>
					<input type="text" id="username" name="username" placeholder=""><br>
					<label for="lname">Password:</label><br>
					<input type="password" id="password" name="password" placeholder=""><br><br>
					<input type="submit" value="Log In">
				</form>
			</div>
		</div>
	</body>
</html>