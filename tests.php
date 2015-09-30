<?php 
  include 'pdo.inc';

  testNewPost($db);

  function testGetGroupId() {
    include 'groupHandler.php';
    echo getGroupId('cool cat group', $db);
  }

  function testNewPost($db) {
    include 'postHandler.php';
    echo createNewPost($db, 12, 1, 'hello ass');
  }
?>
<link rel="stylesheet" href="style.css" />
<br>
<a class="button" href="/">Home</a>