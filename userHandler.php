<?php
  // Contains all the data for the currently logged in user
  include_once('pdo.inc');

  if (session_status() === PHP_SESSION_NONE){session_start();}

  if(isset($_SESSION['id'])) {
    $sessionId = $_SESSION['id'];

    $query = ('SELECT * FROM users WHERE id = :id');
    $statement = $db -> prepare($query);
    $statement -> bindValue(':id', $sessionId);
    $statement -> execute();
    $result = $statement -> fetch(PDO::FETCH_ASSOC);

    $userName = $result['name'];
    $userEmail = $result['email'];
    $areaExpertise = $result['mainArea'];
    $bio = $result['bio'];
    $gpa = $result['gpa'];
    $goal = $result['goal'];
    $skills = $result['skills']; // convert this into an array sometime
  }
?>