<?php include('userHandler.php'); ?>
<?php include('groupHandler.php'); ?>

<?php

if(isset($_GET['error']) && $_GET['error'] == 'db') {
  echo 'some sort of db error, try again maybe?';
  echo $_POST['error'];
}

if(isset($_GET['action']) && $_GET['action'] == "create") {
  createGroup($_POST['name'], $_POST['description'], $userId, $db);
} else { ?>
<!DOCTYPE html>
<html>
<head>
  <title>Create a Group - Teamworker</title>
  <!-- STYLESHEETS -->
  <link href='https://fonts.googleapis.com/css?family=Lato:300,900' rel='stylesheet' type='text/css'>
  <link href='style.css' rel='stylesheet' type='text/css'>
  <link href='colour.css' rel='stylesheet' type='text/css'>
</head>

<body>
    <main>
    <?php include "header.inc"; ?>
    <div class="content">
      <h1>Create a Group</h1>
      <form id="mainForm" name="regoForm" action="createGroup.php?action=create" method="post">
        <label for="name">Name your Group</label><input type="text" name="name" id="name" placeholder="Group Name" required />
        <label for="type">Enter Project Type</label><input type="text" name="type" id="type" placeholder="Project Type" />
        <label for="grade">Grade Aim</label><input type="number" name="gradeWanted" id="grade" placeholder="4" min="4" max="7"/>
        <label for="end">Projected Completion Date</label><input type="date" name="projectEnd" id="end" required/>
        <label for="max">Maximum Number of Members</label><input type="number" name="memberMax" id="max" placeholder="3" min="3" max="6"/>
        <textarea name="description" placeholder="Project Description"></textarea>
        <input type="submit" value="Create" />
      </form>
    </div>
  </main>
</body>
</html>
<?php } ?>
