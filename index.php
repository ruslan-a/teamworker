<?php   
/** 
* Index file, handles all requests, includes all includes
* I'd like to move all pages into here eventually to turn it into a single-page app but *shrugs* 
*/

define('includeConst', TRUE); // Allows this page to be accessed directly, not included in another page

include_once 'pdo.inc';
include_once 'userHandler.php';
include_once 'groupHandler.php';
include_once 'postHandler.php';
include_once 'head.inc';

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

/* login/permissions check
 Role numbers:
 1: student
 2: course coordinator
 3: site admin
 if they're not logged in, only render the login page */
if(!isset($_SESSION['id'])) {    
  include 'login.php';
} else {
  // Page loaders
  if(!isset($_GET['page'])) {  // if no page set then show student/admin home page
    if($role == 1) { include 'studentHome.php'; } else 
    if ($role == 3) { include 'adminHome.php'; }
  } else  {
    switch ($_GET['page']) { 
      case 'profile':
        include 'profile.php';
        include 'profileUpdate.inc';
        break;
      case 'group':
        include 'list.php';
        break;
      case 'editGroup':
        include 'editGroup.php';
        break;
      case 'userSearch':
        include 'filters.php';
        break;
      case 'searchResults':
        include 'searchHandler.php';
        include 'searchResults.php';
        break;
      case 'groupSearch':
        include 'searchGroup.php';
        break;
      case 'createGroup':
        include 'createGroup.php';
        break;
      case 'viewProfile':
        include 'viewProfile.php';
        break;
    }
  }
} 
?>