<?php

require('../includes/connection.php');
require('session.php');

if (isset($_POST['btnlogin'])) {

  $users = trim($_POST['user']);
  $upass = trim($_POST['password']);

  if ($upass == ''){
     ?>
     <script type="text/javascript">
        alert("Password is missing!");
        window.location = "login.php";
     </script>
     <?php
  } else {
    //create some sql statement             
    $sql = "SELECT ID, e.FIRST_NAME, e.LAST_NAME, e.GENDER, e.EMAIL, e.PHONE_NUMBER, j.JOB_TITLE, l.PROVINCE, l.CITY, t.TYPE
            FROM `users` u
            JOIN `employee` e ON e.EMPLOYEE_ID = u.EMPLOYEE_ID
            JOIN `location` l ON e.LOCATION_ID = l.LOCATION_ID
            JOIN `job` j ON e.JOB_ID = j.JOB_ID
            JOIN `type` t ON t.TYPE_ID = u.TYPE_ID
            WHERE `USERNAME` ='" . $users . "' AND `PASSWORD` =  '" . $upass . "'";
    $result = $db->query($sql);

    if ($result) {
      //get the number of results based on the sql statement
      //check the number of results, if equal to one   
      //IF there's a result
      if ($result->num_rows > 0) {
        //store the result to an array and pass it to variable found_user
        $found_user  = mysqli_fetch_array($result);
        //fill the result to session variables
        $_SESSION['MEMBER_ID']  = $found_user['ID']; 
        $_SESSION['FIRST_NAME'] = $found_user['FIRST_NAME']; 
        $_SESSION['LAST_NAME']  = $found_user['LAST_NAME'];  
        $_SESSION['GENDER']     = $found_user['GENDER'];
        $_SESSION['EMAIL']      = $found_user['EMAIL'];
        $_SESSION['PHONE_NUMBER'] = $found_user['PHONE_NUMBER'];
        $_SESSION['JOB_TITLE']   = $found_user['JOB_TITLE'];
        $_SESSION['PROVINCE']    = $found_user['PROVINCE']; 
        $_SESSION['CITY']        = $found_user['CITY']; 
        $_SESSION['TYPE']        = $found_user['TYPE'];
        $AAA = $_SESSION['MEMBER_ID'];

        //this part is the verification if admin or user
        if ($_SESSION['TYPE'] == 'Admin'){
           ?>    
           <script type="text/javascript">
              alert("<?php echo $_SESSION['FIRST_NAME']; ?> Welcome!");
              window.location = "index.php";
           </script>
           <?php        
        } elseif ($_SESSION['TYPE'] == 'User'){
           ?>    
           <script type="text/javascript">
              alert("<?php echo $_SESSION['FIRST_NAME']; ?> Welcome!");
              window.location = "pos.php";
           </script>
           <?php        
        }
      } else {
        //IF there's no result
        ?>
        <script type="text/javascript">
          alert("Username or Password Not Registered! Contact Your administrator.");
          window.location = "index.php";
        </script>
        <?php
      }
    } else {
      echo "Error: " . $sql . "<br>" . $db->error;
    }      
  }       
} 
$db->close();
?>
