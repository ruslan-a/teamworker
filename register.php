<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Register</title>
</head>

<body>
	<h2>Register</h2>
	<form id="mainForm" name="regoForm" action="doRegister.php" method="post"><br>
		<input type="text" name="name" placeholder="First Name" /><br>
		<input type="text" name="dob" placeholder="Date of Birth (DD/MM/YY)" /><br>
		<input type="text" name="email" placeholder="Your email" /><br>
		<input type="password" name="password" placeholder="Password" /><br>
		<input type="password" name="confirm" placeholder="Password again" /><br>
		<input type="submit" value="Register"/>
	</form>
</body>
</html>