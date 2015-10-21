<?php

if(!defined('includeConst')) { die('Direct access not permitted'); } 

if(isset($_GET['error']) && $_GET['error'] == 'db') {
  echo 'some sort of db error, try again maybe?';
  echo $_POST['error'];
}

if(isset($_GET['action']) && $_GET['action'] == "create") {
  createGroup($_POST['name'], $_POST['description'], $_POST['type'], $userId, $db);
} else { ?>

<body>
    <main>
    <?php include "header.inc"; ?>
    <div class="content">
      <h1>Create a Group</h1>
      <form id="mainForm" name="regoForm" action="/?page=createGroup&amp;action=create" method="post">
        <label for="name">Name your Group</label> <input type="text" name="name" id="name" placeholder="Group Name" required />
        <label for="type">Project Type</label>
        <select name="type" id="typeSelect">
          <option value="Web Development">Web Development</option>
          <option value="Programming">Programming</option>
          <option value="Project Leadership">Design</option>
          <option value="Business">Business</option>
        </select><br>
        <label for="grade">Grade Aim</label>
        <input type="number" name="gradeWanted" id="grade" placeholder="4" min="4" max="7"/><br>
        <label for="description">Group description</label>
        <textarea name="description" placeholder="Project Description"></textarea>
        <input type="submit" value="Create" />
      </form>
    </div>
  </main>
</body>
</html>
<?php } ?>
