<?php
  // Contains all the data for the currently logged in user
  include_once('pdo.inc');
  error_reporting(E_ALL);
  ini_set('display_errors', 1);
  session_start();
  if(isset($_SESSION['id'])) {
    $sessionId = $_SESSION['id'];

    $query = ('SELECT * FROM users WHERE id = :id');
    $statement = $db -> prepare($query);
    $statement -> bindValue(':id', $sessionId);
    if (!$statement -> execute()) { print_r($statement->errorInfo()); }
    $result = $statement -> fetch(PDO::FETCH_ASSOC);

    $userId = $_SESSION['id'];
    $userName = $result['name'];
    $userEmail = $result['email'];
    $dob = $result['dob'];
    $areaExpertise = $result['mainArea'];
    $bio = $result['bio'];
    $gpa = $result['gpa'];
    $goal = $result['goal'];
    $group = $result['currentGroup'];
    $skills = $result['skills']; // convert this into an array sometime 
  }

  function getUserName($userId, $db) {
    $query = ('SELECT name FROM users WHERE id = :userId');
    $statement = $db -> prepare($query);
    $statement -> bindValue(':userId', $userId);

    // execute query and print error message if not
    if (!$statement -> execute()) { print_r($stm->errorInfo());}
    $result = $statement -> fetch(PDO::FETCH_ASSOC);
    return $result['name'];
  }
?>