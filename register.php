<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Register</title>
	<?php include "stylesheets.inc"; ?>
</head>

<body>
	<main>
		<!-- including header.inc here also includes nav.inc which breaks everything when you're not logged in -->
		<header>
    	<a href="/" id="logo"><img src="_resources/teamworker.png"></a>
		</header>
		<div class="content">
			<h2>Register</h2>
			<?php if(isset($_GET['error']) && $_GET['error'] == "exists") {
				echo "<h3>User with this email already exists!</h3>";
			} else if(isset($_GET['error']) && $_GET['error'] == "db") {
				echo "<h3>Something went wrong in the database. Try again?</h3>";
			} ?>
			<form id="mainForm" name="regoForm" action="login.php?action=register" method="post"><br>
				<label for="name">Your Name</label><input type="text" name="name" id="name" placeholder="Your name" minlength="2" required/>
				<label for="username">Display Name</label><input type="text" name="username" id="username" placeholder="Display Name" minlength="2" required/>
				<label for="dob">Your date of Birth</label><input type="date" min="1915-01-01" max="2000-01-01" name="dob" id="dob" placeholder="DD/MM/YYYY" required/>
				<label for="email">Your QUT Email address</label><input type="email" id="email" name="email" placeholder="yourname@student.qut.edu.au" required/>
				<label for="email">Your QUT Student ID</label><input type="number" id="studentID" name="studentID" placeholder="8623881" maxlength="7" required/>
				<div class="half-input">
					<label for="password">Password</label><input type="password" id="password" name="password" placeholder="Password" required/>
					<label for="confirm">Confirm Password</label><input type="password" id="confirm" name="confirm" placeholder="Password again" required/>
				</div>
				<input type="submit" value="Register"/>
			</form>
		</div>
	</main>
	<script src="jquery.js"></script>
	<script src="jquery.validate.min.js"></script>
	<script>
	$("mainForm").validate();
	</script>
</body>
</html>