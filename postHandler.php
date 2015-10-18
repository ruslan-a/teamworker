<?php

// Returns the group's posts as an array
function getGroupPosts($db, $group) {
  $query = ('SELECT * FROM posts WHERE groupId = :groupId OR admin = 1 ORDER BY timestamp DESC');
  $statement = $db -> prepare($query);
  $statement -> bindValue(':groupId', $group);
  if (!$statement -> execute()) { print_r($statement->errorInfo()); }
  $result = $statement -> fetchAll(PDO::FETCH_ASSOC);
  return $result;
}

function getAllPosts($db) {
  $query = ('SELECT * FROM posts ORDER BY timestamp DESC');
  $statement = $db -> prepare($query);
  if (!$statement -> execute()) { print_r($statement->errorInfo()); }
  $result = $statement -> fetchAll(PDO::FETCH_ASSOC);
  return $result;
}


// Outputs posts to HTML
// Takes the group's posts as an array ($groupPosts)
// And the database ($db)
function renderGroupPosts($groupPosts, $db) { 

  foreach ($groupPosts as $a) { ?>
    <div class="post">
      <h4><?php echo getUserName($a['userId'], $db); ?></h4>
      <p><?=$a['content'];?></p>
      <a class="timestamp"><?=$a['timestamp'];?></a>
      <?php if($a['admin'] == 1) {
        echo "<span class='postTag'>Announcement<span>";
      } ?>
    </div>
<?php 
}}

// Creates a new post
// $db is database, $group is the group to post in, $user is who made the post, $content is the content itself
function createNewPost($db, $group, $user, $content, $admin) {
  $qString = ('INSERT INTO posts (groupId, userId, content, admin) VALUES (:group, :user, :content, :admin)');
  $stm = $db -> prepare($qString);

  if ($stm -> execute(
    array(              
      ':group' => $group,
      ':user' => $user,
      ':content' => $content,
      ':admin' => $admin))) {
    return true;
  } else {
  print_r($stm->errorInfo());
    return false;
  }
}
?>