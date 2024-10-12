<?php
include '../includes/connection.php';
include '../includes/sidebar.php';

$query = 'SELECT ID, t.TYPE
            FROM users u
            JOIN type t ON t.TYPE_ID=u.TYPE_ID WHERE ID = '.$_SESSION['MEMBER_ID'].'';
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {
    $Aa = $row['TYPE'];
    if ($Aa == 'User') {
?>
<script type="text/javascript">
    //then it will be redirected
    alert("Restricted Page! You will be redirected to POS");
    window.location = "pos.php";
</script>
<?php
    }
}

$sql = "SELECT DISTINCT CNAME, CATEGORY_ID FROM category ORDER BY CNAME ASC";
$result = mysqli_query($db, $sql) or die("Bad SQL: $sql");

$aaa = "<select class='form-control' name='category' required>
        <option disabled selected hidden>Select Category</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $aaa .= "<option value='".$row['CATEGORY_ID']."'>".$row['CNAME']."</option>";
}

$aaa .= "</select>";

$sql2 = "SELECT DISTINCT SUPPLIER_ID, COMPANY_NAME FROM supplier ORDER BY COMPANY_NAME ASC";
$result2 = mysqli_query($db, $sql2) or die("Bad SQL: $sql2");

$sup = "<select class='form-control' name='supplier' required>
        <option disabled selected hidden>Select Supplier</option>";
while ($row = mysqli_fetch_assoc($result2)) {
    $sup .= "<option value='".$row['SUPPLIER_ID']."'>".$row['COMPANY_NAME']."</option>";
}

$sup .= "</select>";
?>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-2 font-weight-bold text-primary">Spare Part&nbsp;<a  href="#" data-toggle="modal" data-target="#aModal" type="button" class="btn btn-primary bg-gradient-primary" style="border-radius: 0px;"><i class="fas fa-fw fa-plus"></i></a></h4>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0"> 
                <thead>
                    <tr>
                        <th>Spare part code</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Category</th>
                        <th>Supplier</th>
                        <th>Year</th>
                        <th>Vehicle Model</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php                  
                    $query = 'SELECT p.PRODUCT_ID, p.PRODUCT_CODE, p.NAME, p.PRICE, c.CNAME, s.COMPANY_NAME, p.DATE_STOCK_IN, p.year, p.vmodel
                              FROM product p 
                              JOIN category c ON p.CATEGORY_ID = c.CATEGORY_ID 
                              JOIN supplier s ON p.SUPPLIER_ID = s.SUPPLIER_ID 
                              GROUP BY p.PRODUCT_CODE';
                    $result = mysqli_query($db, $query) or die(mysqli_error($db));

                    while ($row = mysqli_fetch_assoc($result)) {                             
                        echo '<tr>';
                        echo '<td>'. $row['PRODUCT_CODE'].'</td>';
                        echo '<td>'. $row['NAME'].'</td>';
                        echo '<td>'. $row['PRICE'].'</td>';
                        echo '<td>'. $row['CNAME'].'</td>';
                        echo '<td>'. $row['COMPANY_NAME'].'</td>';
                        echo '<td>'. $row['year'].'</td>';
                        echo '<td>'. $row['vmodel'].'</td>';
                        echo '<td align="right">
                            <a type="button" class="btn btn-warning bg-gradient-warning btn-block" href="pro_edit.php?action=edit&id='.$row['PRODUCT_ID'].'">
                                Edit
                            </a>
                            <a type="button" class="btn btn-warning bg-gradient-warning btn-block" href="pro_del.php?action=del&id='.$row['PRODUCT_ID'].'">
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

<?php
include '../includes/footer.php';
?>

<!-- Product Modal-->
<div class="modal fade" id="aModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Spare Part</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" method="post" action="pro_transac.php?action=add">
                    <div class="form-group">
                        <input class="form-control" placeholder="Spare part ID" name="prodcode" required>
                    </div>
                    <div class="form-group">
                        <input class="form-control" placeholder="Name" name="name" required>
                    </div>
                    <div class="form-group">
                        <input type="number" min="1" max="999999999" class="form-control" placeholder="Quantity" name="quantity" required>
                    </div>
                    <div class="form-group">
                        <input type="number" min="1" max="9999999999" class="form-control" placeholder="Price" name="price" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Year" name="year" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Vehicle Model" name="vmodel" required>
                    </div>
                    <div class="form-group">
                        <?php echo $aaa; ?>
                    </div>
                    <div class="form-group">
                        <?php echo $sup; ?>
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-success"><i class="fa fa-check fa-fw"></i>Save</button>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>      
                </form>  
            </div>
        </div>
    </div>
</div>
