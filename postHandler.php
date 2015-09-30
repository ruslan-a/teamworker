<?php
function getGroupPosts($db, $group) {
  $query = ('SELECT * FROM posts WHERE groupId = :groupId ORDER BY timestamp DESC');
  $statement = $db -> prepare($query);
  $statement -> bindValue(':groupId', $group);
  if (!$statement -> execute()) { print_r($statement->errorInfo()); }
  $result = $statement -> fetchAll(PDO::FETCH_ASSOC);
  return $result;
}

// Creates a new post
// $db is database, $group is the group to post in, $user is who made the post, $content is the content itself
function createNewPost($db, $group, $user, $content) {
  $qString = ('INSERT INTO posts (groupId, userId, content) VALUES (:group, :user, :content)');
  $stm = $db -> prepare($qString);

  if ($stm -> execute(
    array(              
      ':group' => $group,
      ':user' => $user,
      ':content' => $content))) {
    return true;
  } else {
  print_r($stm->errorInfo());
    return false;
  }
}
?>