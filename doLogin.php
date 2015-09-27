<?php
  include('pdo.inc');

  error_reporting(E_ALL);
  ini_set('display_errors', 1);

  $email = $_POST['email'];
  $password = hash('sha256', $_POST['password']);

  $query = ('SELECT * FROM users WHERE email = :email');
  $statement = $db -> prepare($query);
  $statement -> bindValue(':email', $email);
  $statement -> execute();
  $result = $statement -> fetch(PDO::FETCH_ASSOC);

  $dbPass = $result['password'];

  if($dbPass == $password) {
  	if (session_status() === PHP_SESSION_NONE){session_start();}
  	$_SESSION['id'] = $result['id'];
  	echo "<meta http-equiv='REFRESH' content='0;url=index.php?loggedin=true'>";
  } else {
  	echo "<meta http-equiv='REFRESH' content='0;url=login.php?error=true'>";
  }
?>