<nav>
  <div class="topNavProfile">
    <a href='/?page=profile'><?=$userName?></a>
  </div>
  <ul>
    <!-- change nav whether theyre in a group or not -->
    <?php if($group != 0) { ?>
      <li><a href="list.php">my group</a></li>
      <li><a href="filters.php">find members</a></li>
    <?php } ?>
    <?php if($group == 0 AND $role == 1) { ?>
      <li><a href="searchGroup.php">find group</a></li>
      <li><a href="createGroup.php">create group</a></li>
    <?php } ?>
  </ul>
  <!-- TODO I would like this to be dynamically filled from the database based on user role -->
</nav>