<?php include('userHandler.php') ?> <!-- have this at the top of each page -->
<?php echo 'session: '.$_SESSION['id'].'$id'.$id; ?>
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

    <main>
        <?php include "header.inc"; ?>
        <div class="content">
            <h1>Curly Braces</h1>
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

                <h2>Members Online</h2>
                <ul class="status five">
                    <li class="online">
                        <div class="icon">S</div>
                        Sam
                    </li>
                    <li class="online">
                        <div class="icon">J</div>
                        Julie
                    </li>
                    <li>
                        <div class="icon">R</div>
                        Ruslan
                    </li>
                    <li>
                        <div class="icon">A</div>
                        Ali
                    </li>
                    <li>
                        <div class="icon">E</div>
                        Essa
                    </li>
                </ul>
                <ul class="status four">
                    <li class="online">
                        <div class="icon">S</div>
                        Sam
                    </li>
                    <li class="online">
                        <div class="icon">J</div>
                        Julie
                    </li>
                    <li>
                        <div class="icon">R</div>
                        Ruslan
                    </li>
                    <li>
                        <div class="icon">A</div>
                        Ali
                    </li>
                </ul>
                <ul class="status three">
                    <li class="online">
                        <div class="icon">S</div>
                        Sam
                    </li>
                    <li class="online">
                        <div class="icon">J</div>
                        Julie
                    </li>
                    <li>
                        <div class="icon">R</div>
                        Ruslan
                    </li>
                </ul>
                <ul class="status two">
                    <li class="online">
                        <div class="icon">S</div>
                        Sam
                    </li>
                    <li class="online">
                        <div class="icon">J</div>
                        Julie
                    </li>
                </ul>
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
            </div>
        </div>
        <?php include('footer.php'); ?>
    </main>

</body>
</html>
