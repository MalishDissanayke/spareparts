<?php
include '../includes/connection.php';

// Check if category ID is set
if(isset($_GET['id'])) {
    $category_id = $_GET['id'];

    // Delete the category from the database
    $query = "DELETE FROM category WHERE CATEGORY_ID = $category_id";
    mysqli_query($db, $query) or die(mysqli_error($db));

    // Redirect back to the categories page
    header("Location: spare_parts_category.php");
    exit();
} else {
    // Category ID not set, redirect back to the categories page
    header("Location: spare_parts_category.php");
    exit();
}
?>
