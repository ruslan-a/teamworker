<?php include 'userHandler.php';
  include 'groupHandler.php';

if (isset($_GET['a']) && $_GET['a'] == "search") {
    showSearchResults($db, $userName, $group);
} else {
    showSearchForm($userName, $group);
}

function showSearchForm($userName, $group) {
  ?>
  <!DOCTYPE HTML>
  <html>
  <head>

      <!-- TEAMWORKER 1.0 -->

      <!-- TODO: meta -->
      <title>TeamWorker</title>

      <?php include "stylesheets.inc"; ?>

  </head>
  <body>

      <main class="filters">
          <?php include "header.inc"; ?>
          <div class="two">
              <h1>Find A Group</h1>
              <form id="searchForm" action="?a=search" method="POST">
                  <label for="skillField">Keywords</label><br>
                  <input type="text" id="skillField" name="searchTerm" placeholder="php, css, web, android" />
                  <br><br>
                  <label for="fieldSelect">Preferred Project Type</label><br>
                  <select name="field" id="fieldSelect">
                    <option value="">Any</option>
                    <option value="Web Development">Web Development</option>
                    <option value="Programming">Programming</option>
                    <option value="Project Leadership">Design</option>
                    <option value="Business">Business</option>
                  </select>
                  <br><br>
                  <input type="submit" />
                </form>
          </div>
      <?php include 'footer.php' ?>
      </main>
  </body>
  </html>

  <?php 
} //end ShowSearchForm

function showSearchResults($db, $userName, $group) { ?>
<?php
$searchTerm = $_POST['searchTerm']; 

$mainArea = $_POST['field'];

if($mainArea == "") {
  $query = ('SELECT * FROM groups'); 
} 
else {
  $query = ('SELECT * FROM groups WHERE projectType = :mainArea'); 
}


$statement = $db -> prepare($query);
$statement -> bindValue(':mainArea', $mainArea);

if (!$statement -> execute()) {
    print_r($statement->errorInfo());
    return false;
} else { 
  $result = $statement -> fetchAll(PDO::FETCH_ASSOC);?>

    <!DOCTYPE HTML>
    <html>
    <head>

        <!-- TEAMWORKER 1.0 -->

        <!-- TODO: meta -->
        <title>Search Results - TeamWorker</title>

        <?php include "stylesheets.inc"; ?>

    </head>
    <body>
        <main>
            <?php include "header.inc"; ?>

            <div class="content">
                <h1>Search Results</h1>
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Preferred Project Type</th>
                        <th>Actions</th>
                    </tr>
                    <?php foreach ($result as $row) { ?>
                    <tr>
                        <td><?=$row['name']?></td>
                        <td><?=$row['projectType']?></td>
                        <td><a class="button" href="list.php?action=addMeToExisting&amp;group=<?=$row['id']?>">Join Group</a></td>
                    </tr>
                    <?php } ?>

                </table>
            </div>
        </main>

    </body>
    </html>

<?php
  
}
?>


<?php }
?>
