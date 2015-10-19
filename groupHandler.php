<?php
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

function createGroup($groupName, $description, $type, $userId, $db) {
   // creates a group and adds the current user to it 
  strip_tags($groupName);
  strip_tags($description);
  strip_tags($type);

// tHIS IS BROKEN FIX IT
//    $checkIfEmailExists = mysql_query("SELECT email from users WHERE email = '$email'");

//    if(mysql_num_rows($checkIfEmailExists) > 0) {
//        header('Location: /register.php?error=exists');
//   }

  $qString = ('INSERT INTO groups (name, description, projectType) VALUES (:name, :description, :type)');
  $stm = $db -> prepare($qString);

  if ($stm -> execute( array(':name' => $groupName, ':description' => $description, ':type' => $type))) {
    if(addToGroup($userId, $db, getGroupId($groupName, $db), true)) {
      echo "<meta http-equiv='REFRESH' content='0;url=/?page=group'>";
    } else {
      echo 'couldnt add to group!';
    }
  } else {
    print_r($stm->errorInfo());
    //echo "<meta http-equiv='REFRESH' content='0;url=?error=db'>";
  }
}

function updateGroup($groupId, $groupName, $description, $type, $db) {
   // creates a group and adds the current user to it 
  strip_tags($groupName);
  strip_tags($description);
  strip_tags($type);

// tHIS IS BROKEN FIX IT
//    $checkIfEmailExists = mysql_query("SELECT email from users WHERE email = '$email'");

//    if(mysql_num_rows($checkIfEmailExists) > 0) {
//        header('Location: /register.php?error=exists');
//   }

  $qString = ('UPDATE groups SET name = :name, description = :description, projectType = :type WHERE id = :groupId');
  $stm = $db -> prepare($qString);

  if ($stm -> execute( array(':name' => $groupName, ':description' => $description, ':type' => $type, ':groupId' => $groupId))) {
    if(addToGroup($userId, $db, getGroupId($groupName, $db), true)) {
      echo "<meta http-equiv='REFRESH' content='0;url=/?page=group'>";
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
  // echo "adding to group $group user $userId";
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

function setLeader($group, $newLeader, $userId, $db) {
  $query = ('UPDATE users SET groupLeader = 1 WHERE id = :userId');
  $statement = $db -> prepare($query);
  $statement -> bindValue(':userId', $newLeader);

  // execute query and print error message if not
  if (!$statement -> execute()) { return print_r($stm->errorInfo(), true);} else {
    $query = ('UPDATE users SET groupLeader = 0 WHERE id = :userId');
    $statement = $db -> prepare($query);
    $statement -> bindValue(':userId', $userId);
    if (!$statement -> execute()) { return print_r($stm->errorInfo(), true);} else {
      return true;
    }
  }
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
              <a class="button" href="/?page=group&amp;action=remove&amp;user=<?=$a['id']?>" onclick="return confirm('Remove <?=$a['name']?>?')")>Remove from group</a>
              <a class="button" href="/?page=group&amp;action=setLeader&amp;user=<?=$a['id']?>" onclick="return confirm('Set <?=$a['name']?> as leader? This will remove you as leader.')")>Set as leader</a>
            <?php } // end check for self, leader ?></td>
          </tr>
        <?php  } // end looping through group members ?>
      </table>
<?php } ?>



<?php 
// List of group members showing only their names
// Currently used on the student home page
function renderSmallGroupList($db, $group, $groupLeader) { 
  ?><div class="content">
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
      <a class="button left" href="/?page=group">Manage Group</a>
      <?php } // end if?>
    </div><?php 
} ?>
