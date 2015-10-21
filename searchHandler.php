<?php
$searchTerm = $_POST['searchTerm']; 
$mainArea = $_POST['field'];



if($mainArea == "") {
  $query = ('SELECT * FROM users WHERE currentGroup = 0'); 
} 
else {
  $query = ('SELECT * FROM users WHERE mainArea = :mainArea AND currentGroup = 0'); 
}

$statement = $db -> prepare($query);
$statement -> bindValue(':mainArea', $mainArea);

$statement -> execute();
$result = $statement -> fetchAll(PDO::FETCH_ASSOC);

if ($searchTerm != "") { 
  $skillsArray = array_map('trim', explode(',', $searchTerm));
  foreach ($result as $i => $row) {
    $inArray = false;
    foreach($skillsArray as $skill) {
      // echo $skill;
      if (in_array($skill, array_map('trim', explode(',', $row['skills'])))) {
        $inArray = true;
        // echo 'found in array';
      }
    }
    if($inArray == false) {
      unset($result[$i]);
    }

  }
}

?>