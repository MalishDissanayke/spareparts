<?php
include '../includes/connection.php';
include '../includes/sidebar.php';

// Check if category ID is set
if(isset($_GET['id'])) {
    $category_id = $_GET['id'];

    // Fetch category data from the database
    $query = "SELECT * FROM category WHERE CATEGORY_ID = $category_id";
    $result = mysqli_query($db, $query) or die(mysqli_error($db));
    $category = mysqli_fetch_assoc($result);

    if($category) {
        // Category found, display the form for editing
?>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-2 font-weight-bold text-primary">Edit Category</h4>
    </div>
    <div class="card-body">
        <form method="post" action="update_category.php">
            <input type="hidden" name="category_id" value="<?php echo $category['CATEGORY_ID']; ?>">
            <div class="form-group">
                <label for="categoryName">Category Name:</label>
                <input type="text" class="form-control" id="categoryName" name="categoryName" value="<?php echo $category['CNAME']; ?>" required>
            </div>
            <button type="submit" class="btn btn-primary">Update Category</button>
            <a href="spare_parts_category.php" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</div>
<?php
    } else {
        // Category not found, display an error message
        echo '<div class="alert alert-danger" role="alert">Category not found!</div>';
    }
} else {
    // Category ID not set, display an error message
    echo '<div class="alert alert-danger" role="alert">Category ID not provided!</div>';
}

include '../includes/footer.php';
?>
