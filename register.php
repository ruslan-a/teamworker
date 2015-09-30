<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Register</title>
</head>

<body>
	<h2>Register</h2>
	<?php if(isset($_GET['error']) && $_GET['error'] == "exists") {
		echo "<h3>User with this email already exists!</h3>";
	} else if(isset($_GET['error']) && $_GET['error'] == "db") {
		echo "<h3>Something went wrong in the database. Try again?</h3>";
	} ?>
	<form id="mainForm" name="regoForm" action="login.php?action=register" method="post"><br>
		<input type="text" name="name" placeholder="Your name" /><br>
		<input type="text" name="dob" placeholder="Date of Birth" /><br> <!-- i'll find a javascript date picker soon -->
		<input type="text" name="email" placeholder="Your QUT email" /><br>
		<input type="password" name="password" placeholder="Password" /><br>
		<input type="password" name="confirm" placeholder="Password again" /><br>
		<input type="submit" value="Register"/>
	</form>
</body>
</html>