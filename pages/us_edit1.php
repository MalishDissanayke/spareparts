<?php
include('../includes/connection.php');

$zz = $_POST['id'];
$a = $_POST['firstname'];
$b = $_POST['lastname'];
$c = $_POST['gender'];
$d = $_POST['username'];
$e = $_POST['password'];
$f = $_POST['email'];
$g = $_POST['phone'];
$j = $_POST['province'];
$k = $_POST['city'];
$type = isset($_POST['type']) ? $_POST['type'] : null;

// Update query with proper syntax and handling of TYPE_ID if provided
$query = 'UPDATE users u 
          JOIN employee e ON e.EMPLOYEE_ID = u.EMPLOYEE_ID
          JOIN location l ON l.LOCATION_ID = e.LOCATION_ID
          SET e.FIRST_NAME = "'.$a.'", 
              e.LAST_NAME = "'.$b.'", 
              e.GENDER = "'.$c.'", 
              u.USERNAME = "'.$d.'", 
              u.PASSWORD = sha1("'.$e.'"),  
              e.EMAIL = "'.$f.'", 
              l.PROVINCE = "'.$j.'", 
              l.CITY = "'.$k.'", 
              e.PHONE_NUMBER = "'.$g.'"'
              . ($type !== null ? ', u.TYPE_ID = "'.$type.'"' : '') .
          ' WHERE u.ID = "'.$zz.'"';

$result = mysqli_query($db, $query) or die(mysqli_error($db));
?>

<script type="text/javascript">
    alert("You've updated your account successfully.");
    window.location = "user.php";
</script>
