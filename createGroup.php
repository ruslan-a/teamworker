<?php if(isset($_GET['action']) && $_GET['action'] == "create") {
    //insert a record in the db from the form input
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