<?php
// Only render this page if it's included in index.php, not accessed by URL
if(!defined('includeConst')) { die('Direct access not permitted'); } ?>

<body>
<main>
  <?php include "header.inc"; ?>
  <div class="half"> 
    <form action="?action=newPost" method="post">
      <label for="bulletin">Send Global Announcement</label>
      <input type="text" name="content" id="bulletin" placeholder="Enter Announcement Here"/>
      <input type="submit" value="Send"/>
    </form>
    <?php renderGroupPosts(getAllPosts($db), $db) ?>
  </div>

  <div class="half">
  <?php   

    $query = ('SELECT * FROM groups WHERE tutor = :teacherId'); 
    $statement = $db -> prepare($query);
    $statement -> bindValue(':teacherId', $sessionId);
    if (!$statement -> execute()) {
        print_r($statement->errorInfo());
        return false;
    } else { 
      $result = $statement -> fetchAll(PDO::FETCH_ASSOC);
    }
  ?> 
  <h2>Groups</h2>
  <div class="scrollContainer">
    <table>
      <tr>
          <th>Name</th>
          <th>Preferred Project Type</th>
      </tr>
      <?php foreach ($result as $row) { ?>
      <tr>
          <td><?=$row['name']?></td>
          <td><?=$row['projectType']?></td>
      </tr>
      <?php } ?>
    </table>
  </div>

  <?php   
    $query = ('SELECT * FROM users');  
    $statement = $db -> prepare($query);
    if (!$statement -> execute()) {
      print_r($statement->errorInfo());
      return false;
    } else { 
      $result = $statement -> fetchAll(PDO::FETCH_ASSOC);
    }
  ?> 

  </div>
  </div>
<?php include 'footer.php' ?>
</main>
</body>
</html>
