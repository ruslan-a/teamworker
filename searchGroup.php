<?php include('userHandler.php') ?>
<?php 

if (isset($_GET['a']) && $_GET['a'] == "search") {
    showSearchResults();
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
                <label for="fieldSelect">Field of Expertise</label><br>
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

function showSearchResults() { ?>
asdfs
<?php }
?>
