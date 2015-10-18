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

    $query = ('SELECT * FROM groups');  
    $statement = $db -> prepare($query);
    if (!$statement -> execute()) {
        print_r($statement->errorInfo());
        return false;
    } else { 
      $result = $statement -> fetchAll(PDO::FETCH_ASSOC);
    }
  ?> 

    <h2>Groups</h2>
    <table>
      <tr>
          <th>Name</th>
          <th>Preferred Project Type</th>
          <th>Actions</th>
      </tr>
      <?php foreach ($result as $row) { ?>
      <tr>
          <td><?=$row['name']?></td>
          <td><?=$row['projectType']?></td>
          <td><a class="button" href="list.php?action=addMeToExisting&amp;group=<?=$row['id']?>">Join Group</a></td>
      </tr>
      <?php } ?>
    </table>

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

    <h2>Students</h2>
    <table>
        <tr>    <th>Name</th>   <th>Area of Expertise</th>  <th>Actions</th>    </tr>
        <?php // start looping through group members
          foreach (getGroup($db, $group) as $a) {
        ?>
          <tr>
            <td>
              <?php   
                if($a['displayName'] == "") {
                    echo $a['name'];
                  } else {
                    echo $a['displayName'];
                  } 
              ?>
            </td>
            <td><?=$a['mainArea']?></td>
            <td>
            <?php if($a['id'] != $_SESSION['id'] && $groupLeader == true) { // check if person is self or leader dont display remove button ?>
            <a class="button" href="?action=remove&amp;user=<?=$a['id']?>" onclick="return confirm('Remove <?=$a['name']?>?')")>Remove from group</a>
            <?php } }// end check for self, leader ?></td>
          </tr>
    </table>
  </div>
<?php include 'footer.php' ?>
</main>
</body>
</html>
