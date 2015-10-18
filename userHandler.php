<?php
// Contains all the data and functions for the currently logged in user
session_start();
if(isset($_SESSION['id'])) {
  $sessionId = $_SESSION['id'];

  $query = ('SELECT * FROM users WHERE id = :id');
  $statement = $db -> prepare($query);
  $statement -> bindValue(':id', $sessionId);
  if (!$statement -> execute()) { print_r($statement->errorInfo()); }
  $result = $statement -> fetch(PDO::FETCH_ASSOC);

  $userId = $_SESSION['id'];
  $realName = $result['name'];
  
  if($result['displayName'] == "") {
    $userName = $realName;
  } else {
    $userName = $result['displayName'];
  }
  $userEmail = $result['email'];
  $dob = $result['dob'];
  $areaExpertise = $result['mainArea'];
  $bio = $result['bio'];
  $gpa = $result['gpa'];
  $goal = $result['goal'];
  $group = $result['currentGroup'];
  $groupLeader = $result['groupLeader'];
  $skills = $result['skills']; // convert this into an array sometime 
  $role = $result['permissions'];
}

// Returns the name of a user from their ID. 
// $userId is their id
// $db is the database reference
function getUserName($userId, $db) {
  $query = ('SELECT name FROM users WHERE id = :userId');
  $statement = $db -> prepare($query);
  $statement -> bindValue(':userId', $userId);

  // execute query and print error message if not
  if (!$statement -> execute()) { print_r($stm->errorInfo()); 
  } else {
   $result = $statement -> fetch(PDO::FETCH_ASSOC);
   return $result['name']; 
  }
}

function getUserId($userName, $db) {
  $query = ('SELECT id FROM users WHERE name = :userName');
  $statement = $db -> prepare($query);
  $statement -> bindValue(':userName', $userName);

  // execute query and print error message if not
  if (!$statement -> execute()) { print_r($stm->errorInfo()); 
  } else {
   $result = $statement -> fetch(PDO::FETCH_ASSOC);
   return $result['id']; 
  }
}

// check if the role code is capable of posting announcements or not
function canAnnounce($role) {
  if ($role == 2 OR $role == 3) {
    return 1;
  } else {
    return 0;
  }
}
?>