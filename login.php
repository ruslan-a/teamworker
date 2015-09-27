<?php

//log out handler code 
if($_GET['action'] == "logout") {
    echo "logging out";
    if (session_status() === PHP_SESSION_NONE){session_start();}
    unset($_SESSION['id']);
}

// user registration handler code 
if($_GET['action'] == "register") {
    include 'pdo.inc';
    
    error_reporting(E_ALL);
    ini_set('display_errors', 1);

    $name = strip_tags($_POST['name']);
    $dob = strip_tags($_POST['dob']);
    $email = strip_tags($_POST['email']);
    $pass = hash('sha256', $_POST['password']);

    $checkIfEmailExists = mysql_query("SELECT email from users WHERE email = '$email'");

    if(mysql_num_rows($checkIfEmailExists) > 0) {
        header('Location: /register.php?error=exists');
    }

    $qString = ('INSERT INTO users (email, password, name, dob) VALUES (:email, :password, :name, :dob)');
    $stm = $db -> prepare($qString);

    $stm -> execute(
        array(              
            ':email' => $email,
            ':password' => $pass,
            ':name' => $name,
            ':dob' => $dob
        ));
}
?>
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
			<h1>Log in</h1>
                <?php 
                if($_GET['error'] == "true") {
                    echo "<h2>Wrong Login!</h2>";
                }

                if($_GET['action'] == "register") { 
                    echo "<h2>Registration successful! Please log in.</h2>"; 
                } ?>
				<form id="login" name="myForm" action="doLogin.php" method="post">
					<label for="email">QUT email</label>
					<label for="password">Password</label>
					<input type="email" name="email" placeholder="email" id="email">
					<input type="password" name="password" placeholder="password" id="password"><br>
					<input type="submit" value="Log in">
				</form>
        </div>
    </main>

</body>
</html>
