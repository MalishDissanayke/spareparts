<?php
include '../includes/connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['cust_id'], $_POST['firstname'], $_POST['lastname'], $_POST['phonenumber'], $_POST['email'])) {
        $cust_id = $_POST['cust_id'];
        $firstname = $_POST['firstname'];
        $lastname = $_POST['lastname'];
        $phonenumber = $_POST['phonenumber'];
        $email = $_POST['email'];

        // Update customer record in the database
        $update_query = "UPDATE customer 
                         SET FIRST_NAME = '$firstname', LAST_NAME = '$lastname', 
                             PHONE_NUMBER = '$phonenumber', EMAIL = '$email'
                         WHERE CUST_ID = $cust_id";

        if (mysqli_query($db, $update_query)) {
            header("Location: customer.php");
            exit();
        } else {
            echo "Error updating customer: " . mysqli_error($db);
        }
    } else {
        echo "Invalid request. Please fill all required fields.";
    }
} else {
    echo "Invalid request method.";
}
?>
