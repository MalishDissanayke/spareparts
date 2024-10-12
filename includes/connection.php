<?php
 $db = mysqli_connect('localhost', 'root', '1234') or
        die ('Unable to connect. Check connection.');
        mysqli_select_db($db, 'Spare_parts' ) or die(mysqli_error($db));
?>