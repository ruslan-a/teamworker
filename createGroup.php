<?php include('userHandler.php'); ?>
<?php include('groupHandler.php'); ?>

<?php 

if(isset($_GET['error']) && $_GET['error'] == 'db') {
  echo 'some sort of db error, try again maybe?';
}

if(isset($_GET['action']) && $_GET['action'] == "create") {
  // creates a group and adds the current user to it 
  $groupName = strip_tags($_POST['name']);
  $description = strip_tags($_POST['description']);

// tHIS IS BROKEN FIX IT
//    $checkIfEmailExists = mysql_query("SELECT email from users WHERE email = '$email'");

//    if(mysql_num_rows($checkIfEmailExists) > 0) {
//        header('Location: /register.php?error=exists');
//   }

  $qString = ('INSERT INTO groups (name, description) VALUES (:name, :description)');
  $stm = $db -> prepare($qString);

  if ($stm -> execute(
    array(              
      ':name' => $groupName,
      ':description' => $description
    ))) {
    if(addToGroup($userId, $db, getGroupId($groupName, $db))) {
      echo "<meta http-equiv='REFRESH' content='0;url=/list.php'>";
    } else {
      echo 'couldnt add to group!';
    }
  } else {
    echo "<meta http-equiv='REFRESH' content='0;url=?error=db'>";
  }
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