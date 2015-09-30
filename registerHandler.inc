 <?php 
  include_once 'pdo.inc';

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

  $stm -> execute(
    array(              
      ':email' => $email,
      ':password' => $pass,
      ':name' => $name,
      ':dob' => $dob
    ));
?>