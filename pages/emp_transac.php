<?php
include '../includes/connection.php';
include '../includes/sidebar.php';

$query = 'SELECT ID, t.TYPE FROM users u JOIN type t ON t.TYPE_ID = u.TYPE_ID WHERE ID = ' . $_SESSION['MEMBER_ID'];
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {
    $Aa = $row['TYPE'];
    if ($Aa == 'User') {
        echo '<script type="text/javascript">
                alert("Restricted Page! You will be redirected to POS");
                window.location = "pos.php";
              </script>';
        exit(); // Ensure no further code is executed
    }
}

// Check if form data is set
if (isset($_POST['firstname']) && isset($_POST['lastname']) && isset($_POST['phonenumber'])) {
    $fname = $_POST['firstname'];
    $lname = $_POST['lastname'];
    $gen = $_POST['gender'];
    $email = $_POST['email'];
    $phone = $_POST['phonenumber'];
    $jobb = $_POST['jobs'];
    $prov = $_POST['province'];
    $cit = $_POST['city'];

    // Check if the phone number already exists
    $check_query = "SELECT * FROM employee WHERE PHONE_NUMBER = '$phone'";
    $check_result = mysqli_query($db, $check_query);

    if (mysqli_num_rows($check_result) > 0) {
        // Phone number already exists, handle the error as desired
        echo '<script type="text/javascript">
                alert("Phone number already exists in the database.");
                window.location = "employee.php";
              </script>';
    } else {
        // Proceed with the insertion
        switch ($_GET['action']) {
            case 'add':
                mysqli_query($db, "INSERT INTO location (LOCATION_ID, PROVINCE, CITY) VALUES (Null, '$prov', '$cit')");
                mysqli_query($db, "INSERT INTO employee (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, GENDER, EMAIL, PHONE_NUMBER, JOB_ID, LOCATION_ID)
                    VALUES (Null, '{$fname}', '{$lname}', '{$gen}', '{$email}', '{$phone}', '{$jobb}', (SELECT MAX(LOCATION_ID) FROM location))")
                    or die('Error in updating Database');
                break;
        }

        echo '<script type="text/javascript">
                window.location = "employee.php";
              </script>';
    }
}

include '../includes/footer.php';
?>
