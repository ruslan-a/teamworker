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
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Create a Group - Teamworker</title>
</head>

<body>
  <h2>Create a Group</h2>
  <form id="mainForm" name="regoForm" action="createGroup.php?action=create" method="post"><br>
    <input type="text" name="name" placeholder="Group Name" /><br>
    <input type="text" name="type" placeholder="Project Type" /><br>
    <textarea name="description" placeholder="Project Description"></textarea><br>
    <input type="submit" value="Create"/>
  </form>
</body>
</html>
<?php } ?>