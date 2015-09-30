 <?php 
  include_once 'pdo.inc';
  include_once 'userHandler.php';

  $name = strip_tags($_POST['name']);
  $dob = strip_tags($_POST['dob']);
  $email = strip_tags($_POST['email']);
  $pass = hash('sha256', $_POST['password']);

// tHIS IS BROKEN FIX IT
//    $checkIfEmailExists = mysql_query("SELECT email from users WHERE email = '$email'");

//    if(mysql_num_rows($checkIfEmailExists) > 0) {
//        header('Location: /register.php?error=exists');
//   }

  $qString = ('INSERT INTO users (email, password, name, dob) VALUES (:email, :password, :name, :dob)');
  $stm = $db -> prepare($qString);

  


  if (!$stm -> execute(array(              
      ':email' => $email,
      ':password' => $pass,
      ':name' => $name,
      ':dob' => $dob))) 
  {
    print_r($statement->errorInfo());
    echo "<meta http-equiv='REFRESH' content='0;url=/register.php?error=db'>";
  } else {
    $_SESSION['id'] = getUserId($name, $db);
    echo "<meta http-equiv='REFRESH' content='0;url=/profile.php'>";
  }
?>