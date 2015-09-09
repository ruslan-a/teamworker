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
