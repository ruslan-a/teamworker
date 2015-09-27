<?php 
if (isset($_GET['action']) && $_GET['action'] == 'edit') {
  echo "edidint ur ";
  echo $_SESSION['id'];

  include_once 'pdo.inc';
  
  error_reporting(E_ALL);
  ini_set('display_errors', 1);

  $newName = strip_tags($_POST['username']);
  $newDob = strip_tags($_POST['dob']);
  $newMainArea = strip_tags($_POST['mainArea']);
  $newGpa = strip_tags($_POST['gpa']);
  $newGoal = strip_tags($_POST['goal']);
  $newBio = strip_tags($_POST['bio']);

  $qString = ('UPDATE users SET name = :name, dob = :dob, mainArea = :mainArea, gpa = :gpa, goal = :goal, bio = :bio WHERE id = :id');
  $stm = $db -> prepare($qString);

  if (!$stm -> execute(array(    
      ':name' => $newName,
      ':dob' => $newDob,
      ':mainArea' => $newMainArea,
      ':gpa' => $newGpa,
      ':goal' => $newGoal,
      ':bio' => $newBio,
      ':id' => $_SESSION['id'] ))) 
  {
    print_r($stm->errorInfo());
  } else {
    echo "<meta http-equiv='REFRESH' content='0;url=profile.php?updated=true'>";
  }
}
?>