<?php include('userHandler.php') ?>
<?php include('groupHandler.php') ?>
<?php
  //action handler
  if (isset($_GET['action']) && $_GET['action'] == 'remove') {
    removeFromGroup($_GET['user'], $db, $group);
  } else if (isset($_GET['action']) && $_GET['action'] == 'add') {
    addToGroup($_GET['user'], $db, $group, false);
  }
?>
<!DOCTYPE HTML>
<html>
<head>

  <!-- TEAMWORKER 1.0 -->
  <!-- Group member list page -->

  <!-- TODO: meta -->
  <title>TeamWorker</title>

  <?php include "stylesheets.inc"; ?>
</head>


<body>
  <main>
    <?php include "header.inc"; ?>

    <div class="content">
      <!-- make sure theyre in a group -->
      <?php if ($group == 0) {
        echo "<h2>You're not in a group yet!</h2>";
        } else {
        $myGroup = getGroup($db, $group);
      ?>
      <h1><?php echo getGroupName($group, $db); ?></h1>
      <h2 class="subtitle"><?php echo sizeof($myGroup) ?> members</h2>
      <table>
        <tr>    <th>Name</th>   <th>Area of Expertise</th>  <th>Actions</th>    </tr>
        <?php // start looping through group members
          foreach ($myGroup as $a) {
        ?>
          <tr>
            <td><?=$a['displayName']?></td>
            <td><?=$a['mainArea']?></td>
            <td>
            <?php if($a['id'] != $_SESSION['id'] && $groupLeader == true) { // check if person is self or leader dont display remove button ?>
            <a class="button" href="?action=remove&amp;user=<?=$a['id']?>" onclick="return confirm('Remove <?=$a['name']?>?')")>Remove from group</a>
            <?php } // end check for self, leader ?></td>
          </tr>
        <?php  } // end looping through group members ?>
      </table>
      <a class="button right" href="?action=remove&amp;user=<?=$userId?>" onclick="return confirm('Leave <?php echo getGroupName($group, $db); ?>?')">Leave Group</a>
      <a class="button left" href="/">Back Home</a>
      <?php } // end if?>
    </div>
  </main>
</body>
</html>
