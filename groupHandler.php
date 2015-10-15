<?php
include_once('pdo.inc');
error_reporting(E_ALL);
ini_set('display_errors', 1);
//returns currently logged in user's group members
//needs DB reference and user's $group
function getGroup($db, $group) {
$query = ('SELECT * FROM users WHERE currentGroup = :myGroup');
$statement = $db -> prepare($query);
$statement -> bindValue(':myGroup', $group);
if (!$statement -> execute()) {
    print_r($statement->errorInfo());
}
$result = $statement -> fetchAll(PDO::FETCH_ASSOC);
return $result;
}

function createGroup($groupName, $description, $userId, $db) {
   // creates a group and adds the current user to it 
  strip_tags($groupName);
  strip_tags($description);

// tHIS IS BROKEN FIX IT
//    $checkIfEmailExists = mysql_query("SELECT email from users WHERE email = '$email'");

//    if(mysql_num_rows($checkIfEmailExists) > 0) {
//        header('Location: /register.php?error=exists');
//   }

  $qString = ('INSERT INTO groups (name, description) VALUES (:name, :description)');
  $stm = $db -> prepare($qString);

  if ($stm -> execute( array(':name' => $groupName, ':description' => $description))) {
    if(addToGroup($userId, $db, getGroupId($groupName, $db), true)) {
      echo "<meta http-equiv='REFRESH' content='0;url=/list.php'>";
    } else {
      echo 'couldnt add to group!';
    }
  } else {
    print_r($stm->errorInfo());
    //echo "<meta http-equiv='REFRESH' content='0;url=?error=db'>";
  }
}

// removes someone from the group
// takes the $userId of the person to remove
// and the database and the group in question
function removeFromGroup($userId, $db, $group) {
  $query = ('UPDATE users SET currentGroup = 0 WHERE id = :userId');
  $statement = $db -> prepare($query);
  $statement -> bindValue(':userId', $userId);

  // execute query and print error message if not
  if (!$statement -> execute()) { print_r($stm->errorInfo());}
}

function addToGroup($userId, $db, $group, $leader) {
  if ($group == 0) {
    echo "<meta http-equiv='REFRESH' content='0;url=createGroup.php'>";
    return 0;
  }
  $query = ('UPDATE users SET currentGroup = :group, groupLeader = :leader WHERE id = :userId');
  $statement = $db -> prepare($query);
  $statement -> bindValue(':userId', $userId);
  $statement -> bindValue(':group', $group);
  $statement -> bindValue(':leader', $leader);

  // execute query and print error message if not
  if (!$statement -> execute()) { return print_r($stm->errorInfo(), true);} else {
    return true;
  }
}

function getGroupName($groupId, $db) {
  $query = ('SELECT name FROM groups WHERE id = :groupId');
  $statement = $db -> prepare($query);
  $statement -> bindValue(':groupId', $groupId);

  // execute query and print error message if not
  if (!$statement -> execute()) { print_r($stm->errorInfo());}
  $result = $statement -> fetch(PDO::FETCH_ASSOC);
  return $result['name'];
}

function getGroupId($groupName, $db) {
  $query = ('SELECT id FROM groups WHERE name = :groupName');
  $statement = $db -> prepare($query);
  $statement -> bindValue(':groupName', $groupName);

  // execute query and print error message if not
  if (!$statement -> execute()) { print_r($stm->errorInfo());}
  $result = $statement -> fetch(PDO::FETCH_ASSOC);
  return $result['id'];
}

function getGroupDescription($groupId, $db) {
  $query = ('SELECT description FROM groups WHERE id = :groupId');
  $statement = $db -> prepare($query);
  $statement -> bindValue(':groupId', $groupId);

  // execute query and print error message if not
  if (!$statement -> execute()) { print_r($stm->errorInfo());}
  $result = $statement -> fetch(PDO::FETCH_ASSOC);
  return $result['description'];
}

function getGroupType($groupId, $db) {
  $query = ('SELECT projectType FROM groups WHERE id = :groupId');
  $statement = $db -> prepare($query);
  $statement -> bindValue(':groupId', $groupId);

  // execute query and print error message if not
  if (!$statement -> execute()) { print_r($stm->errorInfo());}
  $result = $statement -> fetch(PDO::FETCH_ASSOC);
  return $result['projectType'];
}



// List of group members + details and options
function renderGroupList($db, $group, $groupLeader) { ?>
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
            <?php } // end check for self, leader ?></td>
          </tr>
        <?php  } // end looping through group members ?>
      </table>
<?php } ?>



<?php 
// List of group members showing only their names
// Currently used on the student home page
function renderSmallGroupList($db, $group, $groupLeader) { ?>
    <div class="content">
      <!-- make sure theyre in a group -->
      <?php if ($group == 0) {
        echo "<h2>You're not in a group yet!</h2>";
        } else {
        $myGroup = getGroup($db, $group);
      ?>
      <h2 class="subtitle"><?php echo sizeof($myGroup) ?> members</h2>
      <table>
        <?php // start looping through group members
          foreach ($myGroup as $a) {
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
          </tr>
        <?php  } // end looping through group members ?>
      </table>
      <a class="button left" href="/list.php">Manage Group</a>
      <?php } // end if?>
    </div>
<?php } ?>
