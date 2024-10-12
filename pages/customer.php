<?php
ob_start(); // Start output buffering

include '../includes/connection.php';
include '../includes/sidebar.php';

// Handle form submission to add new customer
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['firstname'], $_POST['lastname'], $_POST['phonenumber'], $_POST['email'])) {
        $firstname = $_POST['firstname'];
        $lastname = $_POST['lastname'];
        $phonenumber = $_POST['phonenumber'];
        $email = $_POST['email'];

        // Check if phone number already exists
        $check_query = "SELECT * FROM customer WHERE PHONE_NUMBER = '$phonenumber'";
        $check_result = mysqli_query($db, $check_query);
        if (mysqli_num_rows($check_result) > 0) {
            echo "Phone number already exists.";
        } else {
            // Check if email already exists
            $check_email_query = "SELECT * FROM customer WHERE EMAIL = '$email'";
            $check_email_result = mysqli_query($db, $check_email_query);
            if (mysqli_num_rows($check_email_result) > 0) {
                echo "Email already exists.";
            } else {
                // Insert customer into database
                $insert_query = "INSERT INTO customer (FIRST_NAME, LAST_NAME, PHONE_NUMBER, EMAIL)
                                 VALUES ('$firstname', '$lastname', '$phonenumber', '$email')";
                if (mysqli_query($db, $insert_query)) {
                    header("Location: customer.php");
                    exit();
                } else {
                    echo "Error: " . $insert_query . "<br>" . mysqli_error($db);
                }
            }
        }
    }
}
?>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-2 font-weight-bold text-primary">Customers</h4>
    </div>
    <div class="card-body">
        <!-- Add New Customer Form -->
        <div class="mb-4">
            <h5 class="font-weight-bold">Add New Customer</h5>
            <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                <div class="form-group">
                    <input class="form-control" placeholder="First Name" name="firstname" required>
                </div>
                <div class="form-group">
                    <input class="form-control" placeholder="Last Name" name="lastname" required>
                </div>
                <div class="form-group">
                    <input type="tel" class="form-control" placeholder="Phone Number" name="phonenumber" required>
                </div>
                <div class="form-group">
                    <input type="email" class="form-control" placeholder="Email" name="email" required>
                </div>
                <button type="submit" class="btn btn-primary">Save</button>
            </form>
        </div>

        <!-- Customer Table -->
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Phone Number</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $query = "SELECT * FROM customer";
                    $result = mysqli_query($db, $query) or die(mysqli_error($db));
                    
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo '<tr>';
                        echo '<td>'. $row['FIRST_NAME'].'</td>';
                        echo '<td>'. $row['LAST_NAME'].'</td>';
                        echo '<td>'. $row['PHONE_NUMBER'].'</td>';
                        echo '<td>'. $row['EMAIL'].'</td>';
                        echo '<td align="center"> 
                                <a type="button" class="btn btn-warning bg-gradient-warning" href="customer_edit.php?id='.$row['CUST_ID'].'">
                                    Edit
                                </a>
                                <a type="button" class="btn btn-danger bg-gradient-danger" href="customer_delete.php?id='.$row['CUST_ID'].'">
                                    Delete
                                </a>
                            </td>';
                        echo '</tr>';
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
    

    <div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-2 font-weight-bold text-primary">Email Messaging</h4>
    </div>
    <div class="card-body">
        <form method="post" action="send_email.php" enctype="multipart/form-data">
            <div class="form-group">
                <label>Select Customers:</label>
                <select class="form-control select2" name="emails[]" multiple required>
                    <?php
                    $query = "SELECT * FROM customer";
                    $result = mysqli_query($db, $query) or die(mysqli_error($db));
                    
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo '<option value="' . $row['EMAIL'] . '">' . $row['FIRST_NAME'] . ' ' . $row['LAST_NAME'] . ' (' . $row['EMAIL'] . ')</option>';
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label>Subject:</label>
                <input type="text" class="form-control" name="subject" required>
            </div>
            <div class="form-group">
                <label>Message:</label>
                <textarea class="form-control" name="message" rows="4" required></textarea>
            </div>
            <div class="form-group">
                <label>Attachments:</label>
                <input type="file" class="form-control-file" name="attachments[]" multiple>
            </div>
            <button type="submit" class="btn btn-primary">Send Email</button>
        </form>
    </div>
</div>






</div>

<?php
include '../includes/footer.php';
ob_end_flush(); // End output buffering and flush output
?>

<!-- Select2 JavaScript Initialization -->
<script>
    $(document).ready(function() {
        $('.select2').select2({
            placeholder: 'Select customers',
            allowClear: true, // Optional: Show clear button
            closeOnSelect: false // Optional: Keep dropdown open after selection
        });
    });
</script>

<!-- Select2 CSS and JavaScript -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
