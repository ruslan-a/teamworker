<?php   
/** 
* Index file, handles all requests, includes all includes
* I'd like to move all pages into here eventually to turn it into a single-page app but *shrugs* 
*/
include_once 'userHandler.php';
include_once 'groupHandler.php';
include_once 'postHandler.php';

define('includeConst', TRUE);

echo '<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>TeamWorker</title>';
include "stylesheets.inc"; 
echo '</head>';

// user registration handler code
if(isset($_GET['action']) && $_GET['action'] == "register") {
  include('registerHandler.inc');
}



// login/permissions check
//  1: student
//  2: course coordinator
//  3: site admin
if(!isset($_SESSION['id'])) {    // if they're not logged in, redirect to the login page
  include 'login.php';
} else {
  if(!isset($_GET['page'])) {  // if no page set then show index
    if($role == 1) { include 'studentHome.php'; } else 
    if ($role == 3) { include 'adminHome.php'; }
  } else if ($_GET['page'] == 'profile') {
    include 'profile.php';
  }

  // new post handler
  if(isset($_GET['action']) && $_GET['action'] == 'newPost') {
    createNewPost($db, $group, $userId, $_POST['content'], canAnnounce($role));
  }

  // log out handler code
  if(isset($_GET['action']) && $_GET['action'] == "logout") {
    if (session_status() === PHP_SESSION_NONE){session_start();}
    unset($_SESSION['id']);
    include 'login.php';
  }
} 
?>