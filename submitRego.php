<?php
	// Gets registration form info from POST, adds it to the database and redirects back to login
	include 'dbConnect.php';
	
	$username = strip_tags($_POST['username']);
	$email = strip_tags($_POST['email']);
	$name = strip_tags($_POST['name']);
	$surname = strip_tags($_POST['surname']);
	$dob = strip_tags($_POST['dob']);
	$phone = strip_tags($_POST['phone']);
	$hashedPass = hash('sha256', $_POST['password']);

	$qString = ('INSERT INTO members (username, password, email, name, surname, dob, phone) VALUES (:username, :password, :email, :name, :surname, :dob, :phone)');
	$stm = $db -> prepare($qString);

	$stm -> execute(
		array(':username' => $username,
				':password' => $hashedPass,
				':email' => $email,
				':name' => $name,
				':surname' => $surname,
				':dob' => $dob,
				':phone' => $phone
		));

	echo '<meta http-equiv="REFRESH" content="0;url=login.php?newuser=true">';
?>