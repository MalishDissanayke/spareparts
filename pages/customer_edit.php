<?php
include '../includes/connection.php';
include '../includes/sidebar.php';

// Check if ID parameter exists in the URL
if (isset($_GET['id'])) {
    $cust_id = $_GET['id'];

    // Fetch customer details from the database based on ID
    $query = "SELECT * FROM customer WHERE CUST_ID = $cust_id";
    $result = mysqli_query($db, $query);

    if (mysqli_num_rows($result) == 1) {
        $row = mysqli_fetch_assoc($result);
        $firstname = $row['FIRST_NAME'];
        $lastname = $row['LAST_NAME'];
        $phonenumber = $row['PHONE_NUMBER'];
        $email = $row['EMAIL'];
    } else {
        echo "Customer not found.";
        exit();
    }
} else {
    echo "Invalid request. Please provide a customer ID.";
    exit();
}
?>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-2 font-weight-bold text-primary">Edit Customer</h4>
    </div>
    <div class="card-body">
        <form method="post" action="customer_edit_process.php">
            <input type="hidden" name="cust_id" value="<?php echo $cust_id; ?>">
            <div class="form-group">
                <label for="firstname">First Name</label>
                <input type="text" class="form-control" id="firstname" name="firstname" value="<?php echo $firstname; ?>" required>
            </div>
            <div class="form-group">
                <label for="lastname">Last Name</label>
                <input type="text" class="form-control" id="lastname" name="lastname" value="<?php echo $lastname; ?>" required>
            </div>
            <div class="form-group">
                <label for="phonenumber">Phone Number</label>
                <input type="tel" class="form-control" id="phonenumber" name="phonenumber" value="<?php echo $phonenumber; ?>" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="<?php echo $email; ?>" required>
            </div>
            <button type="submit" class="btn btn-primary">Save Changes</button>
        </form>
    </div>
</div>

<?php include '../includes/footer.php'; ?>
