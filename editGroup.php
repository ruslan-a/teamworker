<?php include('userHandler.php') ?>
<?php include('groupHandler.php') ?>
<?php
  //action handler
?>
<!DOCTYPE HTML>
<html>
<head>
  <title>TeamWorker</title>
  <?php include "stylesheets.inc"; ?>
</head>


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
      <form name="updateGroup" action="list.php?action=editGroup" method="POST">
        <input type="text" name="name" value="<?php echo getGroupName($group, $db);?>">
        <input type="text" name="description" value="<?php echo getGroupDescription($group, $db) ?>">
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