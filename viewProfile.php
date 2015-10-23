<?php
// Only render this page if it's included in index.php, not accessed by URL
if(!defined('includeConst')) { die('Direct access not permitted'); } ?>

<body>
  <main>
    <?php include "header.inc"; 
    if(isset($_GET['id'])) {
      $query = ('SELECT * FROM users WHERE id = :id');
      $statement = $db -> prepare($query);
      $statement -> bindValue(':id', $_GET['id']);
      if (!$statement -> execute()) { print_r($statement->errorInfo()); }
      $result = $statement -> fetch(PDO::FETCH_ASSOC);

      $userId = $_SESSION['id'];
      $realName = $result['name'];
      
      if($result['displayName'] == "") {
        $userName = $realName;
      } else {
        $userName = $result['displayName'];
      }
      $dob = $result['dob'];
      $areaExpertise = $result['mainArea'];
      $bio = $result['bio'];
      $gpa = $result['gpa'];
      $goal = $result['goal'];
      $group = $result['currentGroup'];
      $skills = $result['skills'];
    }

    ?>
    <div class="content" id="readonly">

      <?php if (isset($_GET['updated']) && $_GET['updated'] == 'true') {
        echo '<h2 class="message">Profile Updated!</h2>';
      } ?>
      <h1><?=$userName?></h1>
      <table>
        <tr><td>Real Name</td> <td><?=$realName?></td></tr>
        <tr><td>Display Name</td> <td><?=$userName?></td></tr>
        <tr><td>Date of Birth</td> <td><?=$dob?></td></tr>
        <tr><td>Area of Expertise</td>  <td><?=$areaExpertise?></td></tr>
        <tr><td>Preferred Grade</td>  <td><?=$goal?></td></tr>
        <tr><td>Current GPA</td>  <td><?=$gpa?></td></tr>
        <tr><td>Skills</td>  <td><?=$skills?></td></tr>
        <tr><td>About Me</td> <td><?=$bio?></td></tr>
      </table>
    </div>
  </main>
</body>
</html>