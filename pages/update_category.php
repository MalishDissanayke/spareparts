<?php
include '../includes/connection.php';

// Check if form data is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if category ID and category name are set
    if (isset($_POST['category_id']) && isset($_POST['categoryName'])) {
        // Sanitize input
        $category_id = mysqli_real_escape_string($db, $_POST['category_id']);
        $category_name = mysqli_real_escape_string($db, $_POST['categoryName']);

        // Update the category in the database
        $query = "UPDATE category SET CNAME = '$category_name' WHERE CATEGORY_ID = $category_id";
        mysqli_query($db, $query) or die(mysqli_error($db));

        // Redirect back to the categories page
        header("Location: spare_parts_category.php");
        exit();
    } else {
        // Category ID or category name not provided, redirect back to the categories page
        header("Location: spare_parts_category.php");
        exit();
    }
} else {
    // If the form data is not submitted via POST method, redirect back to the categories page
    header("Location: spare_parts_category.php");
    exit();
}
?>
