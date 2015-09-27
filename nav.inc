<nav>
  <div class="topNavProfile">
    <?php 
      if($_SESSION['id'] == null) {
        echo "<a href='/login.php'>Log In</a>";
      } else {
        echo "<a href='profile.php'>".$userName."</a>";
      } 
    ?>
  </div>
  <ul>
    <li><a>group</a></li><li><a href="filters.php">find members</a></li>
  </ul>
  <!-- TODO I would like this to be dynamically filled from the database based on user role -->
</nav>