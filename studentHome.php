
<!DOCTYPE HTML>
<html>
<head>

  <!-- TEAMWORKER 1.0 -->

  <!-- TODO: meta -->
  <title>TeamWorker</title>

  <?php include "stylesheets.inc"; ?>

</head>
<body>

  <main>
    <?php include "header.inc"; ?>
    <div class="content">
      <h1><?php echo getGroupName($group, $db); ?></h1>
    </div>
    <div class="glance">

    </div>
    <div class="content">

      <div class="half"><?php renderSmallGroupList($db, $group, $groupLeader); ?></div>
      <div class="half">
      <h2>Posts</h2>
      <form action="?action=newPost" method="post">
        <textarea name="content" placeholder="What's on your mind?" minlength="2" required></textarea>
        <input type="submit" value="Post">
      </form>
      <?php
        $groupPosts = getGroupPosts($db, $group);

        foreach ($groupPosts as $a) { ?>
          <div class="post">
            <h4><?php echo getUserName($a['userId'], $db); ?></h4>
            <p><?=$a['content'];?></p>
            <a class="timestamp"><?=$a['timestamp'];?></a>
          </div>
        <?php } ?>
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
