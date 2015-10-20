<?php

// Returns the group's posts as an array
// $group is the group whose posts to return
function getGroupPosts($db, $group) {
  $query = ('SELECT * FROM posts WHERE groupId = :groupId OR admin = 1 ORDER BY timestamp DESC');
  $statement = $db -> prepare($query);
  $statement -> bindValue(':groupId', $group);
  if (!$statement -> execute()) { print_r($statement->errorInfo()); }
  $result = $statement -> fetchAll(PDO::FETCH_ASSOC);
  return $result;
}

// Returns all posts as an array
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
  echo '<div class="scrollContainer">';
  foreach ($groupPosts as $a) { 
    ?> <div class="post">
      <h4><?php echo getUserName($a['userId'], $db); ?></h4>
      <p><?=$a['content'];?></p>
      <a class="timestamp"><?=$a['timestamp'];?></a>
      <?php if($a['admin'] == 1) {
        echo "<span class='postTag'>Announcement<span>";
      } ?>
    </div> <?php 
  } echo '</div>';
}

// Creates a new post
// $db is database, $group is the group to post in, $user is who made the post, $content is the content itself
function createNewPost($db, $group, $user, $content, $admin) {

  if (isset($_FILES['attachment'])) {
    $target_path = "uploads/";

    /* Add the original filename to our target path.  
    Result is "uploads/filename.extension" */
    $target_path = $target_path . basename( $_FILES['attachment']['name']); 

    $additional = '1';

    while (file_exists($target_path)) {
      $info = pathinfo($target_path);
      $target_path = $info['dirname'] . '/'
                . $info['filename'] . $additional
                . '.' . $info['extension'];
    }

    if(!move_uploaded_file($_FILES['attachment']['tmp_name'], $target_path)) {
        echo "There was an error uploading the file, please try again!";
        die;
    }



    $fullURI = $_SERVER['HTTP_HOST']."/".$target_path;





    $fullURI =  htmlspecialchars($fullURI);

    $content = $content." <a href='http://$fullURI' download>[download attachment]</a>";
  } else {
    echo "no file to upload";
  }



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