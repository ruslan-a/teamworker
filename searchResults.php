<?php include('userHandler.php') ?>
<?php include('searchHandler.php'); ?>
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
                    <th>Main Expertise</th>
                    <th>Actions</th>
                </tr>
                <?php foreach ($result as $a) { ?>
                <tr>
                    <td><?=$a['name']?></td>
                    <td><?=$a['mainArea']?></td>
                    <td><a class="button" href="list.php?action=add&amp;user=<?=$a['id']?>">Add to group</a></td>
                </tr>
                <?php } ?>

            </table>
        </div>
    </main>

</body>
</html>
