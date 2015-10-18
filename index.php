<?php   
/** 
* Index file, handles all requests, includes all includes
* I'd like to move all pages into here eventually to turn it into a single-page app but *shrugs* 
*/
include_once 'userHandler.php';
include_once 'groupHandler.php';
include_once 'postHandler.php';

// action handlers
if(isset($_GET['action']) && $_GET['action'] == 'newPost') {
  createNewPost($db, $group, $userId, $_POST['content'], canAnnounce($role));
}

// login/permissions check
//  1: student
//  2: course coordinator
//  3: site admin
if(!isset($_SESSION['id'])) {
  // if they're not logged in, redirect to the login page
  echo "<meta http-equiv='REFRESH' content='0;url=login.php'>";
} else {
  if($role == 1) {
    include 'studentHome.php';
  } else if ($role == 3) {
    include 'admin.php';
  }  
} 
?>