<?php // index file, handles all requests, includes all includes
  include_once 'userHandler.php';
  include_once 'groupHandler.php';
  include_once 'postHandler.php';

  // action handlers
  if(isset($_GET['action']) && $_GET['action'] == 'newPost') {
    createNewPost($db, $group, $userId, $_POST['content']);
  }

  // login check
  // maybe put user permissions check here too
  if(!isset($_SESSION['id'])) {
    echo "<meta http-equiv='REFRESH' content='0;url=login.php'>";
  } else {
    include 'studentHome.php';
  } 
?>