<nav>
  <div class="topNavProfile">
    <?php 
      if(!isset($_SESSION['id'])) {
        echo "<meta http-equiv='REFRESH' content='0;url=login.php'>";
      } else {
        echo "<a href='profile.php'>".$userName."</a>";
      } 
    ?>
  </div>
  <ul>
    <!-- change nav whether theyre in a group or not -->
    <?php if($group != 0) { ?>
      <li><a href="list.php">group</a></li>
      <li><a href="filters.php">find members</a></li>
    <?php } ?>
    <?php if($group == 0) { ?>
      <li><a href="searchGroup.php">find group</a></li>
      <li><a href="createGroup.php">create group</a></li>
    <?php } ?>
  </ul>
  <!-- TODO I would like this to be dynamically filled from the database based on user role -->
</nav>