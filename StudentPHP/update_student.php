<?php
    $pagetitle = 'Update Student Information';//Page Title

    include ('include/header.php'); //Page Header

    include('include/menu.php'); //Page Menu
    
?>

<h2 id="inputhead">Please enter the ID of the student: </h2>
<!-- Create a form to retrieve the student ID of the student whose information must be updated -->
<form action="update_student.php" method="post">
    <div align="center">
    <input type="text" name="studid" size="20" maxlength="5" value="<?php if (isset($_POST['studid'])) echo $_POST['studid']; ?>" /><!-- The student ID is retrieved using a textbox-->
    <!-- Enter and Reset Buttons are provided for the form -->
    <input type="submit" value="Enter" name="btn Enter">
    <input type="reset" value="Reset" name="btn Reset">
    <input type="hidden" name=submitted1 value="TRUE"/>
</div>
</form>

<?php

if (isset($_POST['submitted1'])){//If the form was submitted correctly
    require_once ('connect_to_mysql.php');

    //function to retrieve the data from the form
    function escapeData ($data) {
        global $dbc;

        if(ini_get('magic_quotes_gpc')) {
            $data = stripslashes($data);
        }

        return mysqli_real_escape_string(mysqli_connect(HOST, USER, PASSWORD), trim($data));
    }

    //Create query to retrieve the data of the student with the student ID obtained from the form
    $searchQuery = "SELECT s.FName, s.LName, y.YearLevelName, s.BirthDate, e.Email FROM student s LEFT JOIN studentemail e ON (s.StudentID = e.StudentID) LEFT JOIN yearlevelgroup y ON (s.YearLevelID = y.YearLevelID) WHERE";

    if (!empty($_POST['studid'])){//Check if a Student ID was obtained from the form
        $sid = escapeData($_POST['studid']);
        $searchQuery = $searchQuery." s.StudentID='".$sid."';";
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

    $searchResult = mysqli_query($dbcon, $searchQuery);//Run the query

    $emails = array();//array to store the emails of each student
    $i = 0;
    while($result = mysqli_fetch_array($searchResult)){//store the data of the student in variables
        $emails[$i] = $result['Email'];
        $fname = $result['FName'];
        $lname = $result['LName'];
        $yearname = $result['YearLevelName'];
        $birthdate = $result['BirthDate'];
        $i++;
    }
    $tnum = mysqli_num_rows($searchResult); //Count how many students were found

    if ($tnum > 0){//If a student was found

        //Display the data of the student
        echo '<div class="display"><div class="firstcolumn"><table align="center" cellspacing="0" cellpadding="5" border="0">
        <tr><td align="left"><b>First Name: </b></td><td align="left">'.$fname.'</td></tr><tr><td align="left"><b>Last Name: </b></td><td align="left">'.$lname.'</td></tr><tr><td align="left"><b>Year Level: </b></td><td align="left">'.$yearname.'</td></tr></table></div>';

        echo '<div class="secondcolumn"><table align="center" cellspacing="0" cellpadding="5" border="0">
        <tr><td align="left"><b>Date of Birth: </b></td><td align="left">'.$birthdate.'</td></tr><tr><td align="left"><b>Emails: </b></td><td align="left">'.$emails[0];
        
        for ($j = 1; $j < $i; $j++){
            echo '\n'.$emails[$j];
        }

        echo '</td></tr></table></div></div>';

        //Create a form to obtain the new data for the student. The data retrieved from the form is sent to update_student_info.php where the database will be updated with the new data.
        echo '<h2 id="inputhead">Please enter the new information of the student</h2>
        <form action="update_student_info.php" method="post" onsubmit="this.submit(); this.reset(); return false;" autocomplete="off">
        <table cellpadding="5" cellspacing="0" border="0" align="center">
            <tr>
                <td><div class="text">First Name: </div></td>
                <td><input type="text" name="studfname" size="20" maxlength="20" value="';
                if (isset($_POST["studfname"])) {echo $_POST["studfname"];}
                echo '" /></td>
    </tr>
    <tr>
                <td><div class="text">Last Name: </div></td>
                <td><input type="text" name="studlname" size="20" maxlength="20" value="';
                if (isset($_POST["studlname"])) echo $_POST["studlname"];
                echo '" /></td>
    </tr>
    <tr>
                <td><div class="text">Date of Birth: </div></td>
                <td><input type="date" id="birthdate" name="birthdate">            
            </td>
    </tr>
    <tr>
        <td><div class="text">Year Level: </div></td>
        <td><select id="yearlevel" name="yearlevel">';
            
            require_once("connect_to_mysql.php");
    
                $yearlevelQuery = "SELECT * FROM YearLevelGroup;";
    
                $yResult = mysqli_query($dbcon, $yearlevelQuery);
    
                echo"<option value'' selected>--- select the year level ---</option>";
                while($row = mysqli_fetch_array($yResult)){
                    echo"<option value=".$row["YearLevelID"].">".$row["YearLevelName"]."</option>";
                }
    echo'
    </select>
    </td>
    </tr>
    </table>
    <br />
    <table cellpadding="5" cellspacing="0" border="0" align="center">
                <tr>
                <td><div class="text">Current Email: </div></td>
                <td><select id="email" name="email">';

                echo"<option value'' selected>--- select the email to be changed ---</option>";
                for($j = 0; $j < $i; $j++){
                    echo"<option value=".$emails[$j].">".$emails[$j]."</option>";
                }
        echo '</select></td>
        <td><div class="text">New Email: </div></td>
        <td><input type="text" name="newemail" size="20" maxlength="50" value="';
        if (isset($_POST["newemail"])) {echo $_POST["newemail"];}
        echo '" /></td>';
    echo '</tr></table>
    <table cellpadding="5" cellspacing="0" border="0" align="center">
    <tr>
    <td colspan="2" align="center"><input type="hidden" name="student_id" value="'.htmlentities($sid).'"/><input type="submit" value="Enter" name="btn Enter1"><input type="reset" value="Reset" name="btn Reset1"><input type="hidden" name=submitted2 value="TRUE"></td>
</tr>
</table>
</form>';
    

}else{//If a student was not found
    //An error message is displayed
    echo '<p class="error" align="center">The student could not be found.</p>';
}//End of if ($tnum > 0)

mysqli_close($dbcon);//Disconnect from database

} //End of if (isset($_POST['submitted1']))
?>
<!-- End of update_student.php -->