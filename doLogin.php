<?php
  include('pdo.inc');

  error_reporting(E_ALL);
  ini_set('display_errors', 1);

  if(!empty($_POST['email'])) { 
    $email = $_POST['email'];
    $password = hash('sha256', $_POST['password']);

    $query = ('SELECT * FROM users WHERE studentID = :email');
    $statement = $db -> prepare($query);
    $statement -> bindValue(':email', $email);
    $statement -> execute();
    $result = $statement -> fetch(PDO::FETCH_ASSOC);

    $dbPass = $result['password'];

    if($dbPass == $password && $password != null) {
    	if (session_status() === PHP_SESSION_NONE){session_start();}
    	$_SESSION['id'] = $result['id'];
    	echo "<meta http-equiv='REFRESH' content='0;url=/'>";
    } else {
    	echo "<meta http-equiv='REFRESH' content='0;url=/?page=login&error=true'>";
    }
  } else {
    echo "<meta http-equiv='REFRESH' content='0;url=/?page=login&error=true&type=empty'>";
  }
?>