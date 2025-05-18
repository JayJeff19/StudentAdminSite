<!-- Start of connect_to_mysql.php -->
<?php
    //Define database access information as constants
    DEFINE('USER', 'root');
    DEFINE('PASSWORD', '');
    DEFINE('HOST', 'localhost');
    DEFINE('DB_NAME', '400011200');

    //Create database connection
    $dbcon = mysqli_connect(HOST, USER, PASSWORD);
    if (!$dbcon){
        die('Could not connect: ' . mysql_error());
    }

    //Select database to connect to
    mysqli_select_db($dbcon, DB_NAME);
?>