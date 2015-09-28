<?php
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
  $query = ('UPDATE users SET currentGroup = :group WHERE id = :userId');
  $statement = $db -> prepare($query);
  $statement -> bindValue(':userId', $userId);
  $statement -> bindValue(':group', $group);

  // execute query and print error message if not
  if (!$statement -> execute()) { print_r($stm->errorInfo());}
}

?>