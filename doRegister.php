<?php
	include 'pdo.inc';
	
	error_reporting(E_ALL);
ini_set('display_errors', 1);

	$username = strip_tags($_POST['username']);
	$email = strip_tags($_POST['email']);
	$name = strip_tags($_POST['name']);
	$dob = strip_tags($_POST['dob']);
	$pass = $_POST['password'];
	// $hashedPass = hash('sha256', $_POST['password']);

	$qString = ('INSERT INTO users (email, password, name, dob) VALUES (:email, :password, :name, :dob)');
	$stm = $db -> prepare($qString);

	$stm -> execute(
		array(				
			':email' => $email,
			':password' => $pass,
			':name' => $name,
			':dob' => $dob
		));

	echo '<meta http-equiv="REFRESH" content="0;url=login.php?newuser=true">';
?>