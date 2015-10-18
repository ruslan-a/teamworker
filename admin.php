<!DOCTYPE HTML>
<html>
<head>
  <!-- TEAMWORKER 1.0 -->

  <title>TeamWorker</title>

  <!-- STYLESHEETS -->
  <link href='https://fonts.googleapis.com/css?family=Lato:300,900' rel='stylesheet' type='text/css'>
  <link href='style.css' rel='stylesheet' type='text/css'>
  <link href='colour.css' rel='stylesheet' type='text/css'>

</head>
<body>

<main>
  <?php include "header.inc"; ?>
  <div class="half"> 
    <form action="?action=newPost" method="post">
      <label for="bulletin">Send Global Announcement</label>
      <input type="text" name="content" id="bulletin" placeholder="Enter Announcement Here"/>
      <input type="submit" value="Send"/>
    </form>
    <?php renderGroupPosts(getAllPosts($db), $db) ?>
  </div>

  <div class="half">
    <h2>Groups</h2>
    <table>
      <tr>
        <th>Group Name</th>
        <th>Number of Members</th>
        <th>Indicated Progress</th>
        <th>Actions</th>
      </tr>
    </table>
    <h2>Students</h2>
    <table>
      <tr>
        <!-- Link to profile on name and link to group page on group -->
        <th>Name</th>
        <th>Display Name</th>
        <th>Group</th>
        <th>Notes</th>
      </tr>
    </table>
  </div>
<?php include 'footer.php' ?>
</main>
</body>
</html>
