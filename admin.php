<!DOCTYPE HTML>
<html>
<head>
    <!-- TEAMWORKER 1.0 -->

    <title>TeamWorker</title>

    <!-- STYLESHEETS -->
    <link href='https://fonts.googleapis.com/css?family=Lato:300,900' rel='stylesheet' type='text/css'>
    <link href='style.css' rel='stylesheet' type='text/css'>
    <link href='colour.css' rel='stylesheet' type='text/css'>

</head>
<body>

    <main>
        <?php include "header.inc"; ?>
        <div class="bulletin">I have decided to make an announcement that everyone on the website should see. I think I am very important and that no-one should be excluded from knowing this information</div>
        <form>
            <label for="bulletin">Send Global Announcement</label><input type="text" name="bulletin" id="bulletin" placeholder="Enter Announcement Here"/>
            <input type="submit" value="Send"/>
        </form>

        <h2>Groups</h2>
            <table>
                <tr>
                    <th>Group Name</th>
                    <th>Number of Members</th>
                    <th>Indicated Progress</th>
                    <th>Actions</th>
                </tr>
            </table>
        <h2>Students</h2>
        <table>
            <tr>
                <!-- Link to profile on name and link to group page on group -->
                <th>Name</th>
                <th>Display Name</th>
                <th>Group</th>
                <th>Notes</th>
            </tr>
        </table>
    <?php include 'footer.php' ?>
    </main>
</body>
</html>
