<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Register</title>
	<?php include "stylesheets.inc"; ?>
</head>

<body>
	<main>
		<?php include "header.inc"; ?>
		<div class="content">
			<h2>Register</h2>
			<?php if(isset($_GET['error']) && $_GET['error'] == "exists") {
				echo "<h3>User with this email already exists!</h3>";
			} else if(isset($_GET['error']) && $_GET['error'] == "db") {
				echo "<h3>Something went wrong in the database. Try again?</h3>";
			} ?>
			<form id="mainForm" name="regoForm" action="login.php?action=register" method="post"><br>
				<label for="name">Your Name</label><input type="text" name="name" id="name" placeholder="Your name" />
				<label for="dob">Your date of Birth</label><input type="date" name="dob" id="dob" placeholder="DD/MM/YYYY" /> <!-- i'll find a javascript date picker soon -->
				<label for="email">Your QUT Email address</label><input type="email" id="email" name="email" placeholder="yourname@student.qut.edu.au" />
				<div class="half-input">
					<label for="password">Password</label><input type="password" id="password" name="password" placeholder="Password" />
					<label for="confirm">Confirm Password</label><input type="password" id="confirm" name="confirm" placeholder="Password again" />
				</div>
				<input type="submit" value="Register"/>
			</form>
		</div>
	</main>
</body>
</html>
