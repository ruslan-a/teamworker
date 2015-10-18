<?php 
if (isset($_GET['action']) && $_GET['action'] == 'edit') {

  $newName = strip_tags($_POST['username']);
  $newDisplayName = strip_tags($_POST['displayname']);
  $newDob = strip_tags($_POST['dob']);
  $newMainArea = strip_tags($_POST['mainArea']);
  $newGpa = strip_tags($_POST['gpa']);
  $newSkills = strip_tags($_POST['skills']);
  $newGoal = strip_tags($_POST['goal']);
  $newBio = strip_tags($_POST['bio']);

  $qString = ('UPDATE users SET name = :name, displayName = :displayname, dob = :dob, mainArea = :mainArea, skills = :skills, gpa = :gpa, goal = :goal, bio = :bio WHERE id = :id');
  $stm = $db -> prepare($qString);

  if (!$stm -> execute(array(    
      ':name' => $newName,
      ':displayname' => $newDisplayName,
      ':dob' => $newDob,
      ':mainArea' => $newMainArea,
      ':skills' => $newSkills,
      ':gpa' => $newGpa,
      ':goal' => $newGoal,
      ':bio' => $newBio,
      ':id' => $_SESSION['id']))) 
  {
    print_r($stm->errorInfo());
  } else {
    echo "<meta http-equiv='REFRESH' content='0;url=?page=profile&amp;updated=true'>";
  }
}
?>