<?php
// Include database connection
include '../includes/connection.php';

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Escape user inputs for security
    $categoryName = mysqli_real_escape_string($db, $_POST['categoryName']);

    // Insert category into database
    $sql = "INSERT INTO category (CNAME) VALUES ('$categoryName')";
    if (mysqli_query($db, $sql)) {
        // Category added successfully, redirect back to the page where categories are listed
        header("Location: spare_parts.php");
        exit();
    } else {
        // Error inserting category
        echo "Error: " . $sql . "<br>" . mysqli_error($db);
    }
}

// Close database connection
mysqli_close($db);
?>
