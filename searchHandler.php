<?php
$searchTerm = $_POST['searchTerm']; 
$mainArea = $_POST['field'];
//echo $searchTerm.", ".$mainArea;

$query = ('SELECT * FROM users WHERE mainArea = :mainArea AND currentGroup != :currentGroup');
$statement = $db -> prepare($query);
$statement -> bindValue(':mainArea', $mainArea);
$statement -> bindValue(':currentGroup', $group);
$statement -> execute();
$result = $statement -> fetchAll(PDO::FETCH_ASSOC);
?>