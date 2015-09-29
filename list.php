<?php include('userHandler.php') ?>
<?php include('groupHandler.php') ?>
<?php
    //action handler
    if (isset($_GET['action']) && $_GET['action'] == 'remove') {
        removeFromGroup($_GET['user'], $db, $group);
    } else if (isset($_GET['action']) && $_GET['action'] == 'add') {
        addToGroup($_GET['user'], $db, $group);
    }
?>
<!DOCTYPE HTML>
<html>
<head>

    <!-- TEAMWORKER 1.0 -->
    <!-- Group member list page -->

    <!-- TODO: meta -->
    <title>TeamWorker</title>

    <!-- STYLESHEETS -->
    <link href='https://fonts.googleapis.com/css?family=Lato:300,900' rel='stylesheet' type='text/css'>
    <link href='style.css' rel='stylesheet' type='text/css'>
    <link href='colour.css' rel='stylesheet' type='text/css'>

</head>


<body>
    <main>
        <?php include "header.inc"; ?>

        <div class="content">
            <!-- make sure theyre in a group -->
            <?php if ($group == 0) { 
                echo "<h2>You're not in a group yet!</h2>";
                } else { ?>
            <h1><?php echo getGroupName($group, $db); ?></h1>
            <table>
                <tr>
                    <th>Name</th>
                    <th>Area of Expertise</th>
                    <th>Actions</th>
                </tr>
                <?php 
                $myGroup = getGroup($db, $group);
                foreach ($myGroup as $a) { 
                    if($a['id'] != $_SESSION['id']) {?>
                <tr>
                    <td><?=$a['name']?></td>
                    <td><?=$a['mainArea']?></td>
                    <td><a class="button" href="?action=remove&amp;user=<?=$a['id']?>" onclick="return confirm('Remove <?=$a['name']?>?')")>Remove from group</a></td>
                </tr>
                <?php }}} ?>
            </table>
        </div>
    </main>

</body>
</html>
