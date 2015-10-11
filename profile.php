<?php include_once 'userHandler.php' ?>
<?php include 'profileUpdate.inc' ?>
<?php if (!isset($_SESSION['id'])) { //login check
  echo "<meta http-equiv='REFRESH' content='0;url=login.php'>";
}?>

<!DOCTYPE HTML>
<html>
<head>
  <!-- TEAMWORKER 1.0 -->
  <meta charset="utf-8">
  <title>Profile - TeamWorker</title>
  <?php include "stylesheets.inc"; ?>
  <script src='jquery.js' type='text/javascript'></script>
</head>

<body>
  <main>
    <?php include "header.inc"; ?>
    <div class="content" id="readonly">
      <?php if (isset($_GET['updated']) && $_GET['updated'] == 'true') {
        echo '<h2 class="message">Profile Updated!</h2>';
      } ?>
      <h1><?=$userName?></h1>
      <h2><?=$userEmail?></h2>
      <a class="button" onclick="showEditor()">Edit</a>
      <table>
        <tr><td>Real Name</td> <td><?=$realName?></td></tr>
        <tr><td>Display Name</td> <td><?=$userName?></td></tr>
        <tr><td>Date of Birth</td> <td><?=$dob?></td></tr>
        <tr><td>Area of Expertise</td>  <td><?=$areaExpertise?></td></tr>
        <tr><td>Preferred Grade</td>  <td><?=$goal?></td></tr>
        <tr><td>Current GPA</td>  <td><?=$gpa?></td></tr>
        <tr><td>Registered Tutorial</td>  <td></td></tr>
        <tr><td>Options</td>  <td></td></tr>
        <tr><td>About Me</td> <td><?=$bio?></td></tr>
        <tr><td>Meeting Availability</td> <td></td></tr>
      </table>
    </div>

    <div class="content" id="editable">
      <h1><?=$userName?></h1>
      <h2><?=$userEmail?></h2>
      <input type="submit" form="profile" class="button" value="save">
      <form id="profile" name="profile" action="profile.php?action=edit" method="post">
        <table>
          <tr><td>Real Name</td> <td><input type="text" name="username" value="<?=$realName?>"></td></tr>
          <tr><td>Display Name</td> <td><input type="text" name="displayname" value="<?=$userName?>"></td></tr>
          <tr><td>Date of Birth</td> <td><input type="date" name="dob" value="<?=$dob?>" min="1915-01-01" max="2000-01-01"></td></tr>
          <tr>
            <td>Area of Expertise</td>
            <td><select name="mainArea" id="mainArea">
              <option value="Web Development" <?php if($areaExpertise == 'Web Development'){echo("selected");}?> >Web Development</option>
              <option value="Programming" <?php if($areaExpertise == 'Programming'){echo("selected");}?> >Programming</option>
              <option value="Project Leadership" <?php if($areaExpertise == 'Project Leadership'){echo("selected");}?> >Project Leadership</option>
              <option value="Business" <?php if($areaExpertise == 'Business'){echo("selected");}?> >Business</option>
            </select></td>
          </tr>
          <tr><td>Preferred Grade</td>  <td><input type="text" name="goal" value="<?=$goal?>"></td></tr>
          <tr><td>Current GPA</td>  <td><input type="text" name="gpa" value="<?=$gpa?>"></td></tr>
          <tr><td>Registered Tutorial</td>  <td></td></tr>
          <tr><td>Options</td>  <td></td></tr>
          <tr><td>About Me</td> <td><input type="text" name="bio" value="<?=$bio?>"></td></tr>
          <tr><td>Meeting Availability</td> <td></td></tr>
        </table>
      </form>
    </div>

  </main>

  <!-- Toggle between editor and viewer -->
  <script type='text/javascript'>
    $('#editable').css('display', 'none');
    function showEditor() {
      $('#editable').css('display', 'block');
      $('#readonly').css('display', 'none');
    }
  </script>
</body>
</html>