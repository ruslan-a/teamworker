<?php
// Only render this page if it's included in index.php, not accessed by URL
if(!defined('includeConst')) { die('Direct access not permitted'); } ?>

<body>
  <main>
    <?php include "header.inc"; 


     if ($group == 0) {
        echo "<h2 class='bigError'>You're not in a group yet! <a href='/?page=groupSearch'>Find</a> or <a href='/?page=createGroup'>create</a> one.</h2>";
        } else { ?>
    <div class="glance">
      <a href="/?page=group"><h1><?php echo getGroupName($group, $db); ?></h1></a>
    </div>
    <div class="content">

      <div class="half"><?php renderSmallGroupList($db, $group, $groupLeader); ?></div>
      <div class="half">
      <h2>Posts</h2>
      <form enctype="multipart/form-data" action="?action=newPost" method="post">
        <input type="hidden" name="MAX_FILE_SIZE" value="10000000" />
        <textarea name="content" placeholder="What's on your mind?" minlength="2" required></textarea>
        <input type="file" name="attachment"></input>
        <input type="submit" value="Post">
      </form>
      <?php renderGroupPosts(getGroupPosts($db, $group), $db);  ?>
      </div>
    </div>
    <?php } ?>
    <?php include('footer.php'); ?>
  </main>
  <script src="jquery.js"></script>
  <script src="jquery.validate.min.js"></script>
  <script>
  $("mainForm").validate();
  </script>
</body>
</html>
