<?php
// Include necessary files
include '../includes/connection.php';
include '../includes/sidebar.php';

// Check if customer ID is provided via GET parameter
if (isset($_GET['id'])) {
    $customer_id = $_GET['id'];

    // Fetch customer details
    $customer_query = "SELECT * FROM customer WHERE CUST_ID = $customer_id";
    $customer_result = mysqli_query($db, $customer_query);
    $customer_data = mysqli_fetch_assoc($customer_result);

    if (!$customer_data) {
        die("Customer not found.");
    }
} else {
    die("Customer ID not provided.");
}

// Handle form submission to add new transaction
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['transaction_date'], $_POST['amount'], $_POST['description'])) {
        $transaction_date = $_POST['transaction_date'];
        $amount = $_POST['amount'];
        $description = $_POST['description'];

        // Insert transaction into database
        $insert_query = "INSERT INTO transactions (CUSTOMER_ID, TRANSACTION_DATE, AMOUNT, DESCRIPTION)
                         VALUES ($customer_id, '$transaction_date', $amount, '$description')";
        if (mysqli_query($db, $insert_query)) {
            echo '<div class="alert alert-success">Transaction added successfully.</div>';
        } else {
            echo '<div class="alert alert-danger">Error adding transaction: ' . mysqli_error($db) . '</div>';
        }
    }
}

// Fetch existing transactions for the customer
$transactions_query = "SELECT * FROM transactions WHERE CUSTOMER_ID = $customer_id ORDER BY TRANSACTION_DATE DESC";
$transactions_result = mysqli_query($db, $transactions_query);
?>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-2 font-weight-bold text-primary">Customer Transactions - <?php echo $customer_data['FIRST_NAME'] . ' ' . $customer_data['LAST_NAME']; ?></h4>
    </div>
    <div class="card-body">
        <!-- Add New Transaction Form -->
        <div class="mb-4">
            <h5 class="font-weight-bold">Add New Transaction</h5>
            <form method="post" action="<?php echo $_SERVER['PHP_SELF'] . '?id=' . $customer_id; ?>">
                <div class="form-group">
                    <label for="transaction_date">Transaction Date:</label>
                    <input type="date" class="form-control" id="transaction_date" name="transaction_date" required>
                </div>
                <div class="form-group">
                    <label for="amount">Amount:</label>
                    <input type="number" min="0" step="0.01" class="form-control" id="amount" name="amount" required>
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Save Transaction</button>
            </form>
        </div>

        <!-- Transaction History Table -->
        <div class="table-responsive">
            <table class="table table-bordered" id="transactionTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Amount</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    while ($transaction = mysqli_fetch_assoc($transactions_result)) {
                        echo '<tr>';
                        echo '<td>' . $transaction['TRANSACTION_DATE'] . '</td>';
                        echo '<td>$' . $transaction['AMOUNT'] . '</td>';
                        echo '<td>' . $transaction['DESCRIPTION'] . '</td>';
                        echo '<td align="center"> 
                                <a type="button" class="btn btn-warning bg-gradient-warning" href="transaction_edit.php?id=' . $transaction['TRANSACTION_ID'] . '">
                                    Edit
                                </a>
                                <a type="button" class="btn btn-danger bg-gradient-danger" href="transaction_delete.php?id=' . $transaction['TRANSACTION_ID'] . '">
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
</div>

<?php include '../includes/footer.php'; ?>
                    