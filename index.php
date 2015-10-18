<?php   
/** 
* Index file, handles all requests, includes all includes
* I'd like to move all pages into here eventually to turn it into a single-page app but *shrugs* 
*/

include_once 'pdo.inc';
include_once 'userHandler.php';
include_once 'groupHandler.php';
include_once 'postHandler.php';


include_once 'head.inc';

define('includeConst', TRUE);

// Action handlers
if(isset($_GET['action'])) {
  switch($_GET['action']) {
   case 'newPost': 
    createNewPost($db, $group, $userId, $_POST['content'], canAnnounce($role));
    break; 
  case "register": 
    include('registerHandler.inc');
    break;
  case "logout":
    if (session_status() === PHP_SESSION_NONE){session_start();}
    unset($_SESSION['id']);
    break;
  }
} 

// login/permissions check
//  1: student
//  2: course coordinator
//  3: site admin
// if they're not logged in, redirect to the login page
if(!isset($_SESSION['id'])) {    
  include 'login.php';
} else {
  // Page loaders
  if(!isset($_GET['page'])) {  // if no page set then show index
    if($role == 1) { include 'studentHome.php'; } else 
    if ($role == 3) { include 'adminHome.php'; }
  } else if ($_GET['page'] == 'profile') {
    include 'profile.php';
    include 'profileUpdate.inc';
  }
} 
?>