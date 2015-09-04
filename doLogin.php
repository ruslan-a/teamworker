<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include('pdo.inc');

$email = $_POST['email'];
//$password = hash('sha256', $_POST['password']);
$password = $_POST['password'];

echo "posted: ".$email." ".$password;

$query = ('SELECT * FROM users WHERE email = :email');
$statement = $db -> prepare($query);
$statement -> bindValue(':email', $email);
$statement -> execute();
$result = $statement -> fetch(PDO::FETCH_ASSOC);

$dbPass = $result['password'];

if($dbPass == $password) {
	session_start();
	$_SESSION['id'] = $result['id'];
	$test = $_SESSION['id'];
	// if you just registered, add yourself as a friend before showing the news feed
	echo "<meta http-equiv='REFRESH' content='0;url=index.php?loggedin=true'>";
} else {
	echo "wrong";
}
?>