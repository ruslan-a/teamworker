<?php
// Only render this page if it's included in index.php, not accessed by URL
if(!defined('includeConst')) { die('Direct access not permitted'); } ?>

<body>
  <main>
    <?php include "header.inc"; ?>
    <div class="glance">
      <h1><?php echo getGroupName($group, $db); ?></h1>
    </div>
    <div class="content">

      <div class="half"><?php renderSmallGroupList($db, $group, $groupLeader); ?></div>
      <div class="half">
      <h2>Posts</h2>
      <form action="?action=newPost" method="post">
        <textarea name="content" placeholder="What's on your mind?" minlength="2" required></textarea>
        <input type="submit" value="Post">
      </form>
      <?php renderGroupPosts(getGroupPosts($db, $group), $db);  ?>
      </div>
    </div>
    <?php include('footer.php'); ?>
  </main>
  <script src="jquery.js"></script>
  <script src="jquery.validate.min.js"></script>
  <script>
  $("mainForm").validate();
  </script>
</body>
</html>
