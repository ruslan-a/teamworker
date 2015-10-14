
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
      <h3>Current Project Completion</h3>
      <div class="progress-bar">
        <div class="progress">
        </div>
        <div class="progress-display">30%</div>
      </div>
      <h3>Project Timeline</h3>
      <div class="progress-bar">
        <div class="progress">
        </div>
        <div class="progress-display left">30/07/15</div>
        <div class="progress-display">30%</div>
        <div class="progress-display right">20/10/15</div>
      </div>
      <div class="half">
        <h3>Next Key Date</h3>
        <div class="blue-square">
          <span><h1>27 AUG</h1></span>
        </div>
        <h3 class="inline">Begin Development Stage and have a picnic</h3>

      </div>
      <div class="half">
        <h3>Current Task</h3>
        <div class="blue-square">
          <span><h1>27 AUG</h1></span>
        </div>
        <h3 class="inline">Complete Design Mockup</h3>

      </div>

    </div>
    <div class="content">
      <div class="half">
        <h2>Last Meeting - 20/07/15</h2>
        <h3>View Minutes <span class="blue">&gt;</span></h3>
        <a class="button" href="/list.php">See all members</a>
      </div>
      <div class="half">
        <form class="mini">
          <h3>Add Key Date</h3>
          <input type="date">
          <input type="text" placeholder="title" class="small">
          <input type="submit" value="+">
        </form>
        <form class="mini">
          <h3>Add item to Agenda</h3>
          <input type="text">
          <input type="submit" value="+">
        </form>

        <h2>Posts</h2>
        <form action="?action=newPost" method="post">
          <textarea name="content" placeholder="What's on your mind?"></textarea>
          <input type="submit">
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

</body>
</html>
