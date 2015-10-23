<?php
// Only render this page if it's included in index.php, not accessed by URL
if(!defined('includeConst')) { die('Direct access not permitted'); } ?>

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

      <?php if($groupLeader == 1) { ?>
        <a class="button right" href="#" onclick="alert('Group leader cant leave the group - set someone else as leader first.');">Leave Group</a>
      <?php } else { ?>
        <a class="button right" href="/?page=group&amp;action=remove&amp;user=<?=$userId?>" onclick="return confirm('Leave <?php echo getGroupName($group, $db); ?>?')">Leave Group</a>
      <?php } ?>
      <a class="button left" href="/">Back Home</a>
      <?php } // end if?>
    </div>
    <?php include 'footer.php' ?>
  </main>
</body>
</html>
