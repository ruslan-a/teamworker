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
?>