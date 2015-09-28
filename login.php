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
<head>
  <!-- TEAMWORKER 1.0 -->

  <!-- TODO: meta -->
  <title>TeamWorker</title>

  <!-- STYLESHEETS -->
  <link href='https://fonts.googleapis.com/css?family=Lato:300,900' rel='stylesheet' type='text/css'>
  <link href='style.css' rel='stylesheet' type='text/css'>
  <link href='colour.css' rel='stylesheet' type='text/css'>

</head>
<body>

  <main>
    <header>
      <a href="/" id="logo"><img src="_resources/teamworker.png"></a>
    </header>
    <div class="content">
      <h1>Log in</h1>
        <?php 
          if (isset($_GET['error']) AND $_GET['error'] == 'true') {
            echo "<h2>Wrong Login!</h2>";
          } else if (isset($_GET['action']) AND $_GET['action'] == 'register') {
            echo "<h2>Registration successful! Please log in.</h2>"; 
          }
        ?>
        
        <form id="login" name="myForm" action="doLogin.php" method="post">
          <label for="email">QUT email</label>
          <label for="password">Password</label>
          <input type="email" name="email" placeholder="email" id="email">
          <input type="password" name="password" placeholder="password" id="password"><br>
          <input type="submit" value="Log in">
        </form>
    </div>
  </main>

</body>
</html>
