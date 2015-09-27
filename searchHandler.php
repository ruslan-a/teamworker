<?php
ini_set('display_errors',1);
ini_set('display_startup_errors',1);
error_reporting(-1);
include('pdo.inc');

$searchTerm = $_POST['searchTerm']; 
$mainArea = $_POST['field'];
//echo $searchTerm.", ".$mainArea;

$query = ('SELECT * FROM users WHERE mainArea = :mainArea');
$statement = $db -> prepare($query);
$statement -> bindValue(':mainArea', $mainArea);
$statement -> execute();
$result = $statement -> fetchAll(PDO::FETCH_ASSOC);

function convertMainAreaLabel($uglyName) {
   switch($uglyName) {
    case "business":
      return "Business";
      break;
    case "web":
      return "Web Development";
      break;
    case "leader":
      return "Team Leadership";
      break;
    case "code";
      return "Programming";
      break;
  }
}
?>