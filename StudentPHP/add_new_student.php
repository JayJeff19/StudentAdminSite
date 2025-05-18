<?php
    $pagetitle = 'Add New Students'; //Page Title

    include ('include/header.php'); //Display Header

    //start of add_new_student.php

    include('include/menu.php'); //Display Menu
    
?>

<h2 id="inputhead">Please enter the student's information</h2>
<!-- Create form to get student data -->
<form action="add_new_student.php" method="post" onsubmit="this.submit(); this.reset(); return false;" autocomplete="off">
    <table cellpadding="5" cellspacing="0" border="0" align="center">
        <tr><!-- Get the first name of the new student from the web page -->
            <td><div class="text">First Name: </div></td><!-- The student's first name is entered into a textbox -->
            <td><input type="text" name="studfname" size="20" maxlength="20" value="<?php if (isset($_POST['studfname'])) echo $_POST['studfname']; ?>" /></td>
</tr>
<tr><!-- Get the last name of the new student from the web page -->
            <td><div class="text">Last Name: </div></td><!-- The student's last name is entered into a textbox -->
            <td><input type="text" name="studlname" size="20" maxlength="20" value="<?php if (isset($_POST['studlname'])) echo $_POST['studlname']; ?>" /></td>
</tr>
<tr><!-- Get the date of birth of the new student from the web page -->
            <td><div class="text">Date of Birth: </div></td><!-- The date of birth is entered using a calendar -->
            <td><input type="date" id="birthdate" name="birthdate">            
        </td>
</tr>
<tr><!-- Get the year level that the new student is in from the web page -->
    <td><div class="text">Year Level: </div></td> 
    <td><select id="yearlevel" name="yearlevel">
        <?php
            require_once('connect_to_mysql.php');

            $yearlevelQuery = "SELECT * FROM YearLevelGroup;";//Get all the year levels from the database

            $yResult = mysqli_query($dbcon, $yearlevelQuery);

            echo"<option value'' selected>--- select the year level ---</option>";//Display all the year levels in a drop down box
            while($row = mysqli_fetch_array($yResult)){
                echo"<option value=".$row['YearLevelID'].">".$row['YearLevelName']."</option>";
            }
        ?>
</select>
</td>
</tr>
<tr><!-- Get the email of the new student from the web page -->
            <td><div class="text">Email: </div></td><!-- The new email is entered into a textbox -->
            <td><input type="text" name="email" size="20" maxlength="50" value="<?php if (isset($_POST['email'])) echo $_POST['email']; ?>" /></td>
</tr>
<tr><!-- Enter and Reset Buttons are provided for the form -->
    <td colspan="2" align="center"><input type="submit" value="Enter" name="btn Enter"> <input type="reset" value="Reset" name="btn Reset">
    <input type="hidden" name=submitted value="TRUE"/></td>
</tr>
        </table>
</form>

<?php

if (isset($_POST['submitted'])){//If the form was correctly submitted
    require_once ('connect_to_mysql.php');

    //function to retrieve the data from the form
    function escapeData ($data) {
        global $dbc;

        if(ini_get('magic_quotes_gpc')) {
            $data = stripslashes($data);
        }

        return mysqli_real_escape_string(mysqli_connect(HOST, USER, PASSWORD), trim($data));
    }

    $errors = array();//array to capture each piece of data missing from the form
    
    //verifies if the first name was entered into the form
    if (empty($_POST['studfname'])){
            $errors[] = 'You forgot to enter the first name of the student.';
    }else{
        $fname = escapeData($_POST['studfname']);
    }

    //verifies if the last name was entered into the form
    if (empty($_POST['studlname'])){
        $errors[] = 'You forgot to enter the last name of the student.';
    }else{
        $lname = escapeData($_POST['studlname']);
    }

    //verifies if the date of birth was entered into the form
    if (empty($_POST['birthdate'])){
        $errors[] = 'You forgot to enter the birth date of the student.';
    }else{
        $birthResult = escapeData($_POST['birthdate']);
        $date = str_replace('/', '-', $birthResult);
        $birthdate = date('Y-m-d', strtotime($date));
    }

    //verifies if the year level was entered into the form
    if (empty($_POST['yearlevel'])){
        $errors[] = 'You forgot to enter the year level of the student.';
    }else{
        $yearlevel = escapeData($_POST['yearlevel']);
    }

    //verifies if the email was entered into the form
    if (empty($_POST['email'])){
        $errors[] = 'You forgot to enter the email of the student.';
    }else{
        $email = escapeData($_POST['email']);
    }
    //if there are no errors/missing pieces of data
    if(empty($errors)){

        require_once('connect_to_mysql.php');

        $idquery = "SELECT MAX(StudentID) AS maxID FROM student";//find the last student ID in the database

        $idResult = mysqli_query($dbcon, $idquery);

        //create new student ID
        $IDs = mysqli_fetch_array($idResult);

        $maxID = $IDs['maxID'];

        $idnum = '';

        for ($i = 2; $i < 5; $i++){
            $idnum = $idnum.$maxID[$i];
        }

        (int)$idnum++;

        $newstudid = 'SS';
        $addlen =  3 - strlen($idnum);
        while ($addlen != 0){
            $newstudid = $newstudid.'0';
            $addlen--;
        }

        $newstudid = $newstudid.$idnum;//new student ID is stored

        // query to insert the student data into the student table
        $studentinsertQuery = "INSERT INTO student VALUES ('$newstudid', '$yearlevel', '$fname', '$lname', '$birthdate');";

        // query to insert the new email into the studentemail table
        $emailinsertQuery = "INSERT INTO studentemail VALUES ('$newstudid', '$email');";

        //run the queries
        $studentResult = mysqli_query($dbcon, $studentinsertQuery);

        $emailResult = mysqli_query($dbcon, $emailinsertQuery);

        
        if($studentResult && $emailResult) {//if no errors occurred when running both queries
            echo '<h1 id="mainhead">Success!</h1>
            <p align="center">The new student has been registered!</p><p><br /></p>';

            exit();
        }else{//if an error occurred when running either query
            echo '<h1 id="mainhead">System Error</h1>
            <p class="error">The new student could not be registered due to a system error. We apologize for any inconvenience.</p>';

            //display the query that returned an error
            if (!$studentResult){
                echo '<p>' . mysqli_error($dbcon) . '<br /><br />Query: '.$studentinsertQuery.'</p>';
            }
            if (!$emailResult){
                echo '<p>' . mysqli_error($dbcon) . '<br /><br />Query: '.$emailinsertQuery.'</p>';
            }

            exit();
        }

    } else {//if data was missing from the form
        //inform the user of the error
        echo '<h1 id"mainhead>Error!</h1>
        <p class="error">The following error(s) occurred:<br />';

        //display which pieces of data is missing
        foreach ($errors as $msg) {
            echo " - $msg<br />\n";
        }
        echo '</p><p>Please try again.</p><p><br /></p>';
    }//end of if(empty($errors))

    mysqli_close($dbcon);//close the database connection

}//end of if (isset($_POST['submitted'])
?>
<!-- end of add_new_student.php -->