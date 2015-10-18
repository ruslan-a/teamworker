<?php
//log out handler code
if(isset($_GET['action']) && $_GET['action'] == "logout") {
  if (session_status() === PHP_SESSION_NONE){session_start();}
  unset($_SESSION['id']);
}

// user registration handler code
if(isset($_GET['action']) && $_GET['action'] == "register") {
  include('registerHandler.inc');
}
?>
<!doctype html>
<html lang="en">
<head>
  <!-- TEAMWORKER 1.0 -->
  <meta charset="utf-8">
  <title>TeamWorker</title>
  <?php include "stylesheets.inc"; ?>
  
</head>
<body>
  <main class="login">
    <header>
      <a href="/" id="logo"><img src="_resources/teamworker.png" alt="TeamWorker"></a>
    </header>
    <div class="content">
      <h1>Log in</h1>
      <br>
      <?php
        if (isset($_GET['error']) AND $_GET['error'] == 'true') {
          echo "<h2 style='color: orange; text-transform: none;'>Wrong login, try again!</h2>";
        } else if (isset($_GET['action']) AND $_GET['action'] == 'register') {
          echo "<h2>Registration successful! Please log in.</h2>";
        }
      ?>
      <form id="login" name="myForm" action="doLogin.php" method="post">
        <label for="email">QUT ID</label>
        <input type="number" name="email" placeholder="8623881" id="email">
        <br><br>
        <label for="password">Password</label>
        <input type="password" name="password" placeholder="********" id="password">
        <br><br><a href="register.php" class="subtitle">No account yet? Sign up now!</a><br><br>
        <input type="submit" value="Log in">
      </form>
    </div>
  </main>
</body>
</html>
