<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Sign Up - Shrekspace</title>
	<?php include 'headInfo.php'; ?>
	<link rel="stylesheet" href="form.css" /> <!-- i put the form styles into a separate file cause there're a lot -->
	<script src="validate.js" type="text/javascript"> </script> <!-- validation script -->
</head>

<body>
	<div id="wrapper">
		<?php include('header.php'); ?>
		<!-- content is the majority of the page, basically everything between the header, sidebar and footer -->
		<div id="content">
			<h2 class="contentHeader">Sign up now.</h2>

			<!-- this is kinda messy but it's the best way ive found so far to have the error messages inline. Each errorMessage class is set to display:none in CSS and when an error needs to be displayed the JS activates them -->
			<!-- the form uses the onsubmit= property to call my javascript validate() class which retuns either true or false, if false the form isn't submitted and an error displays on the page -->
			<!-- also I'm using the HTML5 'placeholder' attribute here because it's honestly the best way to do this, despite breaking 100% xhtml compliance -->
			<form id="mainForm" name="myForm" onsubmit="return validate();" action="submitRego.php" method="post">
				
				<div class="formElement">
					<input type="text" name="name" onchange="hideErrors()" placeholder="First Name" />
					<div id="firstNameError" class="errorMessage">Please enter a name.</div>
				</div>
				
				<div class="formElement">
					<input type="text" name="surname" onchange="hideErrors()" placeholder="Surname" />
					<div id="surnameError" class="errorMessage">Please enter a surname.</div><br/>
				</div>

				<div class="formElement">
					<input type="text" name="dob" onchange="hideErrors()" placeholder="Date of Birth (DD/MM/YY)" />
					<div id="dobError" class="errorMessage">Please enter your DOB</div>
				</div>

				<div class="formElement">				
					<select name="gender" onchange="hideErrors()">
						<option value="pick">Pick a gender</option>
						<option value="female">Female</option>
						<option value="male">Male</option>
						<option value="other">Other</option>
						<option value="na">Don't show</option>
					</select>
					<div id="genderError" class="errorMessage">Please pick a gender</div><br>
				</div>

				<div class="formElement">
					<input type="text" name="phone" onchange="hideErrors()" placeholder="Phone Number" />
					<div id="noNumberError" class="errorMessage">Please enter a phone number</div>
					<div id="lengthNumberError" class="errorMessage">Must be at least 8 characters</div>
					<div id="invNumberError" class="errorMessage">That doesn't look like a number</div><br/>
				</div>

				<div class="formElement">
					<input type="text" name="email" onchange="hideErrors()" placeholder="Your email" />
					<div id="noEmailError" class="errorMessage">Please enter an email</div>
					<div id="emailFormatError" class="errorMessage">That's not a valid email</div>
				</div>

				<div class="formElement">				
					<input type="text" name="username" onchange="hideErrors()" placeholder="Desired username" /> 
					<div id="noUserError" class="errorMessage">Please enter a username</div> <br>
				</div>

				<div class="formElement">				
					<input type="password" name="password" onchange="hideErrors()" placeholder="Password" />
					<div id="noPassError" class="errorMessage">Please enter a password</div>
					<div id="passLengthError" class="errorMessage">Must be at least 8 characters</div>
				</div>

				<div class="formElement">
					<input type="password" name="confirm" onchange="hideErrors()" placeholder="Password again" />
					<div id="noConfirmError" class="errorMessage">Please retype your password</div>
					<div id="confirmMatchError" class="errorMessage">Passwords don't match</div><br/>
				</div>

				<input type="submit" value="Sign up"/>
			</form>
		</div>

		<?php include('sidebar.php'); ?>
		<?php include('footer.php'); ?>
	</div>
</body>
</html>
