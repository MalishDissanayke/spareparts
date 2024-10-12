<?php
// Start output buffering
ob_start();

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

// Check if form is submitted
if (isset($_POST['firstname']) && isset($_POST['lastname']) && isset($_POST['phonenumber'])) {
    $fname = $_POST['firstname'];
    $lname = $_POST['lastname'];
    $pn = $_POST['phonenumber'];
    

    // Check if the phone number already exists
    $check_query = "SELECT * FROM customer WHERE PHONE_NUMBER = '$pn'";
    $check_result = mysqli_query($db, $check_query);
    if (mysqli_num_rows($check_result) > 0) {
        // Phone number already exists, handle the error as desired
        echo "Phone number already exists in the database.";
    } else {
        // Insert the record into the database
        $query = "INSERT INTO customer (CUST_ID, FIRST_NAME, LAST_NAME, PHONE_NUMBER)
                  VALUES (NULL, '{$fname}', '{$lname}', '{$pn}')";
        if (mysqli_query($db, $query)) {
            // Success, redirect to the customer page
            header("Location: customer.php");
            exit();
        } else {
            // Error inserting record
            echo "Error: " . $query . "<br>" . mysqli_error($db);
        }
    }
}

// Flush the output buffer
ob_end_flush();
?>

<?php include '../includes/footer.php'; ?>
