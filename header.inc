<header>
    <a href="/" id="logo"><img src="_resources/teamworker.png"></a>
    <nav>
      <div class="topNavProfile">
        <a href='/?page=profile'><?=$userName?></a>
      </div>
      <ul>
        <!-- change nav whether theyre in a group or not -->
        <?php if($group != 0) { ?>
          <li><a href="/?page=group">my group</a></li>
          <li><a href="/?page=userSearch">find members</a></li>
        <?php } ?>
        <?php if($group == 0 AND $role == 1) { ?>
          <li><a href="/?page=groupSearch">find group</a></li>
          <li><a href="/?page=createGroup">create group</a></li>
        <?php } ?>
      </ul>
      <!-- TODO I would like this to be dynamically filled from the database based on user role -->
    </nav>
</header>