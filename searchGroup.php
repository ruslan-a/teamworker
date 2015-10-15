<?php include('userHandler.php') ?>
<?php 

if (isset($_GET['a']) && $_GET['a'] == "search") {
    showSearchResults($db);
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
                <input type="text" id="skillField" name="searchTerm" placeholder="skill" />
                <br><br>
                <label for="fieldSelect">Project Type</label><br>
                <select name="field" id="fieldSelect">
                  <option value="">Any</option>
                  <option value="Web Development">Web Development</option>
                  <option value="Programming">Programming</option>
                  <option value="Project Leadership">Project Leadership</option>
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

<?php } 

function showSearchResults($db) { ?>
<?php
$searchTerm = $_POST['searchTerm']; 
$mainArea = $_POST['field'];

$query = ('SELECT * FROM users WHERE mainArea = :mainArea AND currentGroup = 0');
$statement = $db -> prepare($query);
$statement -> bindValue(':mainArea', $mainArea);

$statement -> execute();
$result = $statement -> fetchAll(PDO::FETCH_ASSOC);
echo $result['id'];
?>


<?php }
?>
