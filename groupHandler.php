<?php
include_once('pdo.inc');
error_reporting(E_ALL);
ini_set('display_errors', 1);
//returns currently logged in user's group members
//needs DB reference and user's $group
function getGroup($db, $group) {
$query = ('SELECT * FROM users WHERE currentGroup = :myGroup');
$statement = $db -> prepare($query);
$statement -> bindValue(':myGroup', $group);
if (!$statement -> execute()) {
    print_r($statement->errorInfo());
}
$result = $statement -> fetchAll(PDO::FETCH_ASSOC);
return $result;
}

// removes someone from the group
// takes the $userId of the person to remove
// and the database and the group in question
function removeFromGroup($userId, $db, $group) {
  $query = ('UPDATE users SET currentGroup = 0 WHERE id = :userId');
  $statement = $db -> prepare($query);
  $statement -> bindValue(':userId', $userId);

  // execute query and print error message if not
  if (!$statement -> execute()) { print_r($stm->errorInfo());}
}

function addToGroup($userId, $db, $group) {
  if ($group == 0) {
    echo "<meta http-equiv='REFRESH' content='0;url=createGroup.php'>";
    return 0;
  }
  $query = ('UPDATE users SET currentGroup = :group WHERE id = :userId');
  $statement = $db -> prepare($query);
  $statement -> bindValue(':userId', $userId);
  $statement -> bindValue(':group', $group);

  // execute query and print error message if not
  if (!$statement -> execute()) { return print_r($stm->errorInfo(), true);} else {
    return true;
  }
}

function getGroupName($groupId, $db) {
  $query = ('SELECT name FROM groups WHERE id = :groupId');
  $statement = $db -> prepare($query);
  $statement -> bindValue(':groupId', $groupId);

  // execute query and print error message if not
  if (!$statement -> execute()) { print_r($stm->errorInfo());}
  $result = $statement -> fetch(PDO::FETCH_ASSOC);
  return $result['name'];
}

function getGroupId($groupName, $db) {
  $query = ('SELECT id FROM groups WHERE name = :groupName');
  $statement = $db -> prepare($query);
  $statement -> bindValue(':groupName', $groupName);

  // execute query and print error message if not
  if (!$statement -> execute()) { print_r($stm->errorInfo());}
  $result = $statement -> fetch(PDO::FETCH_ASSOC);
  return $result['id'];
}

?>