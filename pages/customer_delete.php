<?php
include '../includes/connection.php';

// Check if ID parameter exists in the URL
if (isset($_GET['id'])) {
    $cust_id = $_GET['id'];

    // Delete customer from the database
    $delete_query = "DELETE FROM customer WHERE CUST_ID = $cust_id";

    if (mysqli_query($db, $delete_query)) {
        header("Location: customer.php");
        exit();
    } else {
        echo "Error deleting customer: " . mysqli_error($db);
    }
} else {
    echo "Invalid request. Please provide a customer ID.";
    exit();
}
?>
