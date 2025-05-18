<?php
    $pagetitle = 'View Joined Clubs';

    include ('include/header.php');

//Start of viewjoinedclubs.php
    include('include/menu.php');
    
?>

<h2 id="inputhead">Please enter your student ID: </h2>
<!-- Create a form to retrieve the student ID of the student whose clubs will be viewed -->
<form action="viewjoinedclubs.php" method="post">
    <div align="center">
    <input type="text" name="studid" size="20" maxlength="5" value="<?php if (isset($_POST['studid'])) echo $_POST['studid']; ?>" /><!-- The student ID is retrieved using a textbox-->
    <!-- Enter and Reset Buttons are provided for the form -->
    <input type="submit" value="Enter" name="btn Enter">
    <input type="reset" value="Reset" name="btn Reset">
    <input type="hidden" name=submitted value="TRUE"/>
</div>
</form>

<?php
if (isset($_POST['submitted'])){//If the form was submitted correctly
    require_once ('connect_to_mysql.php');

    //function to retrieve the data from the form
    function escapeData ($data) {
        global $dbc;

        if(ini_get('magic_quotes_gpc')) {
            $data = stripslashes($data);
        }

        return mysqli_real_escape_string(mysqli_connect(HOST, USER, PASSWORD), trim($data));
    }

    //Create query to retrieve the Club Name and Payment status of the each club the student is in
    $searchQuery = "SELECT c.ClubName, cm.ClubPayment FROM clubmembership cm, club c, student s WHERE (s.StudentID = cm.StudentID AND c.ClubID = cm.ClubID)";

    if (!empty($_POST['studid'])){//Check if a student id was entered
        $sid = escapeData($_POST['studid']);
        $searchQuery = $searchQuery." AND cm.StudentID='".$sid."'";//add condition to the query
    } else {//If a student ID was not entered, an error message is displayed
        echo "<h1 class='mainhead'>Error!!!</h1>";
            echo "<p align='center'>There was no student ID submitted</p>";

            exit();
    }

    $idquery = "SELECT MAX(StudentID) AS maxID FROM student";//find the last student ID in the database

    $idResult = mysqli_query($dbcon, $idquery);//Run query

    //Store result in  a variable
    $IDs = mysqli_fetch_array($idResult);

    $maxID = $IDs['maxID'];

    if ($sid > $maxID){//Check if the student ID that was retrieved from the form is larger than the last ID entered in the student table
        //Error message is displayed
        echo "<p align='center'>There is no such student in the database</p>";

        exit();
    }

    $searchQuery = $searchQuery." ORDER BY c.ClubName ASC;";//Sort the result in ascending order

    $searchResult = mysqli_query($dbcon, $searchQuery); //Run the query

    $tnum = mysqli_num_rows($searchResult);//Count how many clubs were found
    
    $nameQuery = "SELECT CONCAT(FName, ' ', LName) AS fullname FROM student WHERE StudentID = '".$sid."';";//Get the name of the student

    $nameResult = mysqli_query($dbcon, $nameQuery); //Run name query

    $name = mysqli_fetch_array($nameResult);//Store name on variable

    if ($tnum > 0){//If clubs were found

        //Display the number of clubs that the student is registered for
        echo "<p align='center'>".$name['fullname']." is currently in <b>".$tnum."</b> clubs.</p>";

        //Display the club name and payment status of each club the student is registered for
        echo '<table align="center" cellspacing="0" cellpadding="5" border="1">
        <tr><td align="left"><b>Club Name</b></td><td align="left"><b>Payment Status</b></td>';
        
        while ($row = mysqli_fetch_array($searchResult)){
            echo '<tr><td align="left">' . $row['ClubName'] . '</td><td align="left">' . $row['ClubPayment'] . '</td></tr>';
        }

        echo '</table>';

        mysqli_free_result($searchResult);
    }else{//If no clubs were found
        echo '<p class="error" align="center">'.$name['fullname'].' is not in any clubs.</p>';
    }//End of if ($tnum > 0)

    mysqli_close($dbcon); //Disconnect from database

}//End of if (isset($_POST['submitted']))
?>

<!-- End of viewjoinedclubs.php -->