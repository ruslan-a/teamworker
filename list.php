<?php
// Only render this page if it's included in index.php, not accessed by URL
if(!defined('includeConst')) { die('Direct access not permitted'); } ?>

<?php
  //action handler
  if (isset($_GET['action']) && $_GET['action'] == 'remove') {
    removeFromGroup($_GET['user'], $db, $group);
    echo "<meta http-equiv='REFRESH' content='0;url=/?page=group'>";
  } else if (isset($_GET['action']) && $_GET['action'] == 'add') {
    addToGroup($_GET['user'], $db, $group, false);
  } else if (isset($_GET['action']) && $_GET['action'] == 'addMeToExisting') {
    if(addToGroup($userId, $db, $_GET['group'], false)) {
      echo "<meta http-equiv='REFRESH' content='0;url=/?page=group'>";
    }
  } else if (isset($_GET['action']) && $_GET['action'] == 'editGroup') {
    updateGroup($group, $_POST['name'], $_POST['description'], $_POST['type'], $db);
  }
?>

<body>
  <main>
    <?php include "header.inc"; ?>
    <div class="content">
      <!-- make sure theyre in a group -->
      <?php
      if ($group == 0) {
        echo "<h2>You're not in a group yet!</h2>";
      } else {
        $myGroup = getGroup($db, $group);
      ?>

      <h1><?php echo getGroupName($group, $db);?></h1>
      <h2 class="subtitle">
      <?php echo getGroupDescription($group, $db)."<br>".getGroupType($group, $db)."<br>".sizeof($myGroup) ?> members</h2>
      <br>
      <?php if($groupLeader == 1) { ?><a class="button" href="?page=editGroup">Edit Group Details</a><?php } ?>

      <?php renderGroupList($db, $group, $groupLeader); ?>
      <a class="button right" href="/?page=group&amp;action=remove&amp;user=<?=$userId?>" onclick="return confirm('Leave <?php echo getGroupName($group, $db); ?>?')">Leave Group</a>
      <a class="button left" href="/">Back Home</a>
      <?php } // end if?>
    </div>
    <?php include 'footer.php' ?>
  </main>
</body>
</html>
