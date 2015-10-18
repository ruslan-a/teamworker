<?php
// Only render this page if it's included in index.php, not accessed by URL
if(!defined('includeConst')) { die('Direct access not permitted'); } ?>

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
