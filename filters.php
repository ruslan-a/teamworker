<?php include('userHandler.php') ?>
<!DOCTYPE HTML>
<html>
<head>

    <!-- TEAMWORKER 1.0 -->

    <!-- TODO: meta -->
    <title>TeamWorker</title>

    <!-- STYLESHEETS -->
    <link href='https://fonts.googleapis.com/css?family=Lato:300,900' rel='stylesheet' type='text/css'>
    <link href='style.css' rel='stylesheet' type='text/css'>
    <link href='colour.css' rel='stylesheet' type='text/css'>

</head>
<body>

    <main class="filters">
        <?php include "header.inc"; ?>
        <div class="two">
            <h1>Find New Members</h1>
            <form id="searchForm" action="searchResults.php" method="POST">
                <label for="skillField">Skill Keyword</label><br>
                <input type="text" id="skillField" name="searchTerm" placeholder="skill" />
                <br><br>
                <label for="fieldSelect">Field of Expertise</label><br>
                <select name="field" id="fieldSelect">
                  <option value="">Any</option>
                  <option value="web">Web Development</option>
                  <option value="code">Programming</option>
                  <option value="leader">Project Leadership</option>
                  <option value="business">Business</option>
                </select>
                <br><br>
                <input type="submit" />
              </form>
            <h2>Three Column Filter List</h2>
            <ul class="filters three">
                <li><span>Filter One</span></li>
                <li><span>Filter Two</span></li>
                <li><span>Filter Three</span></li>
            </ul>
            <h2>Four Column Filter List</h2>
            <ul class="filters four">
                <li><span>1</span></li>
                <li><span>2</span></li>
                <li><span>3</span></li>
                <li><span>4</span></li>
            </ul>
        </div>
    </main>

</body>
</html>
