<?php include('searchHandler.php'); ?>

<!DOCTYPE HTML>
<html>
<head>

    <!-- TEAMWORKER 1.0 -->

    <!-- TODO: meta -->
    <title>Search Results - TeamWorker</title>

    <!-- STYLESHEETS -->
    <link href='https://fonts.googleapis.com/css?family=Lato:300,900' rel='stylesheet' type='text/css'>
    <link href='style.css' rel='stylesheet' type='text/css'>
    <link href='colour.css' rel='stylesheet' type='text/css'>

</head>
<body>
    <main>
        <?php include "header.inc"; ?>

        <div class="content">
            <h1>Search Results</h1>
            <table>
                <tr>
                    <th>Name</th>
                    <th>Main Expertise</th>
                    <th>Actions</th>
                </tr>
                <?php foreach ($result as $a) { ?>
                <tr>
                    <td><?=$a['name']?></td>
                    <td><?=convertMainAreaLabel($a['mainArea'])?></td>
                    <td></td>
                </tr>
                <?php } ?>

            </table>
        </div>
    </main>

</body>
</html>
