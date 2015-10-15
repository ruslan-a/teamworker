<?php include('userHandler.php') ?>
<?php include('groupHandler.php') ?>
<?php
  //action handler
  if (isset($_GET['action']) && $_GET['action'] == 'remove') {
    removeFromGroup($_GET['user'], $db, $group);
    echo "<meta http-equiv='REFRESH' content='0;url=index.php'>";
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
      <h1><?php echo getGroupName($group, $db);?></h1>
      <h2 class="subtitle">
      <?php echo getGroupDescription($group, $db)."<br>".getGroupType($group, $db)."<br>".sizeof($myGroup) ?> members</h2>
      <?php renderGroupList($db, $group, $groupLeader); ?>
      <a class="button right" href="?action=remove&amp;user=<?=$userId?>" onclick="return confirm('Leave <?php echo getGroupName($group, $db); ?>?')">Leave Group</a>
      <a class="button left" href="/">Back Home</a>
      <?php } // end if?>
    </div>
  </main>
</body>
</html>
