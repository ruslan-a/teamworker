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
      <form name="updateGroup" action="?page=group&amp;action=editGroup" method="POST">
        <label for="name">Group Name</label>
          <input type="text" name="name" value="<?php echo getGroupName($group, $db);?>">
        <label for="description">Description</label>
          <input type="text" name="description" value="<?php echo getGroupDescription($group, $db) ?>">
        <label for="type">Preferred Project Type</label>
          <select name="type" id="type">
            <option value="Web Development" <?php if(getGroupType($group, $db) == 'Web Development'){echo("selected");}?> >Web Development</option>
            <option value="Programming" <?php if(getGroupType($group, $db) == 'Programming'){echo("selected");}?> >Programming</option>
            <option value="Business" <?php if(getGroupType($group, $db) == 'Business'){echo("selected");}?> >Business</option>
            <option value="Design" <?php if(getGroupType($group, $db) == 'Design'){echo("selected");}?> >Design</option>
          </select></td>
        <input type="submit" class="button" value="Save Edits">
      </form>
      <?php } ?>
    </div>
  </main>
</body>
</html>