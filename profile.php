<!DOCTYPE HTML>
<html>
<head>
  <!-- TEAMWORKER 1.0 -->

  <!-- TODO: meta -->
  <title>Profile - TeamWorker</title>

  <!-- STYLESHEETS -->
  <link href='https://fonts.googleapis.com/css?family=Lato:300,900' rel='stylesheet' type='text/css'>
  <link href='style.css' rel='stylesheet' type='text/css'>
  <link href='colour.css' rel='stylesheet' type='text/css'>
</head>
<body>
  <main>
    <?php include "header.inc"; ?>
    <?php if (!isset($_SESSION['id'])) {
      echo "<meta http-equiv='REFRESH' content='0;url=login.php'>";
    }?>

    <div class="content" id="readonly">
      <h1><?=$userName?></h1>
      <h2><?=$userEmail?></h2>
      <a class="button">Edit</a>
      <table>
        <tr>
          <td>Display Name</td> <td><?=$userName?></td>
        </tr>
        <tr>
          <td>Area of Expertise</td>  <td><?=$areaExpertise?></td>
        </tr>
        <tr>
          <td>Preferred Grade</td>  <td><?=$goal?></td>
        </tr>
        <tr>
          <td>Current GPA</td>  <td><?=$gpa?></td>
        </tr>
        <tr>
          <td>Registered Tutorial</td>  <td></td>
        </tr>
        <tr>
          <td>Options</td>  <td></td>
        </tr>
        <tr>
          <td>About Me</td> <td><?=$bio?></td>
        </tr>
        <tr>
          <td>Meeting Availability</td> <td></td>
        </tr>
      </table>
    </div>

    <div class="content" id="editable">
      <h1><?=$userName?></h1>
      <h2><?=$userEmail?></h2>
      <a class="button">Save</a>
      <table>
        <tr>
          <td>Display Name</td> <td><?=$userName?></td>
        </tr>
        <tr>
          <td>Area of Expertise</td>  <td><?=$areaExpertise?></td>
        </tr>
        <tr>
          <td>Preferred Grade</td>  <td><?=$goal?></td>
        </tr>
        <tr>
          <td>Current GPA</td>  <td><?=$gpa?></td>
        </tr>
        <tr>
          <td>Registered Tutorial</td>  <td></td>
        </tr>
        <tr>
          <td>Options</td>  <td></td>
        </tr>
        <tr>
          <td>About Me</td> <td><?=$bio?></td>
        </tr>
        <tr>
          <td>Meeting Availability</td> <td></td>
        </tr>
      </table>
    </div>

  </main>
</body>
</html>