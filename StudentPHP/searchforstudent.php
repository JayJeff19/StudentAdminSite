<?php
    $pagetitle = 'Search for A Student';//Page Title

    include ('include/header.php');//Page Header

    //Start of searchforstudent.php

    include('include/menu.php');//Page Menu
    
?>

<h2 id="inputhead">Search for student by: </h2>
<!-- Create form to get search criteria about the student(s) to be found -->
<form action="searchforstudent.php" method="post" onsubmit="this.submit(); this.reset(); return false;" autocomplete="off">
    <table cellpadding="5" cellspacing="0" border="0" align="center">
        <tr><!-- Read the student's ID from the form -->
            <td><div class="text">Student ID: </div></td>
            <td><input type="text" name="studid" size="20" maxlength="5" value="<?php if (isset($_POST['studid'])) echo $_POST['studid']; ?>" /></td>
</tr>
<tr><!-- Read the student's first name from the form -->
            <td><div class="text">First Name: </div></td><!-- Retrieve the first name using a textbox -->
            <td><input type="text" name="studfname" size="20" maxlength="20" value="<?php if (isset($_POST['studfname'])) echo $_POST['studfname']; ?>" /></td>
</tr>
<tr><!-- Read the student's last name from the form -->
            <td><div class="text">Last Name: </div></td><!-- Retrieve the last name using a textbox -->
            <td><input type="text" name="studlname" size="20" maxlength="20" value="<?php if (isset($_POST['studlname'])) echo $_POST['studlname']; ?>" /></td>
</tr>
<tr><!-- Read the student's date of birth from the form -->
            <td><div class="text">Date of Birth: </div></td>
            <td><input type="date" id="birthdate" name="birthdate"><!-- Retrieve the date of birth using a calendar -->            
        </td>
        <td><div class="text">Date Range: </div></td>
        <td><select id="range" name="range"><!-- Retrieve the date range (before, after, or equal to)
                                                of the date of birth the user wants to view -->
            <option value='=' selected>Equal</option>
            <option value='<='>Before</option>
            <option value='>='>After</option>
</select>
</td>
</tr>
<tr><!-- Read the year level that the student is in from the form -->
    <td><div class="text">Year Level: </div></td>
    <td><select id="yearlevel" name="yearlevel">
        <?php
            require_once('connect_to_mysql.php');

            $yearlevelQuery = "SELECT * FROM YearLevelGroup;";//query to retrieve all the year levels in the database

            $yResult = mysqli_query($dbcon, $yearlevelQuery);

            echo"<option value'' selected>--- select the year level ---</option>";//Display all the year levels in a drop down box
            while($row = mysqli_fetch_array($yResult)){
                echo"<option value=".$row['YearLevelID'].">".$row['YearLevelName']."</option>";
            }
        ?>
</select>
</td>
</tr>
<tr><!-- Read the club that the student is in from the form -->
    <td><div class="text">Club: </div></td>
    <td><select id="club" name="club">
        <?php
            require_once('connect_to_mysql.php');

            $clubQuery = "SELECT ClubID, ClubName FROM club;";//query to retrieve all the clubs in the database

            $clubResult = mysqli_query($dbcon, $clubQuery);

            echo"<option value'' selected>--- select the club ---</option>";//Display all the clubs in a drop down box
            while($row = mysqli_fetch_array($clubResult)){
                echo"<option value=".$row['ClubID'].">".$row['ClubName']."</option>";
            }
        ?>
</select>
</td>
</tr>
<tr><!-- Enter and Reset Buttons are provided for the form -->
    <td colspan="2" align="center"><input type="submit" value="Search" name="btn_Search"><input type="reset" value="Reset" name="btn_Reset">
    <input type="hidden" name=submitted value="TRUE" /></td>
</tr>
</table>
</form>

<?php
if (isset($_POST['submitted'])){//if the the form was submitted correctly
    require_once ('connect_to_mysql.php');

    //function to retrieve the data from the form
    function escapeData ($data) {
        global $dbc;

        if(ini_get('magic_quotes_gpc')) {
            $data = stripslashes($data);
        }

        return mysqli_real_escape_string(mysqli_connect(HOST, USER, PASSWORD), trim($data));
    }

        require_once('connect_to_mysql.php');

        //Create query - adding conditions depending on what information was submitted
        $searchQuery = "SELECT s.StudentID, CONCAT(s.FName, ' ', s.LName) AS studName, y.YearLevelName, s.BirthDate FROM student s, yearlevelgroup y WHERE (s.YearLevelID = y.YearLevelID)";


        //Check if a club was entered
        if (!empty($_POST['club'])){
            $club = escapeData($_POST['club']);
            if ($club != '--- select the club ---'){//since the drop down box automatically has data, check if an actual club was selected

            //Create query if a club was selected
            $searchQuery = "SELECT s.StudentID, CONCAT(s.FName, ' ', s.LName) AS studName, y.YearLevelName, s.BirthDate FROM student s,  clubmembership cm, yearlevelgroup y WHERE  (s.YearLevelID = y.YearLevelID) AND (s.StudentID = cm.StudentID) AND cm.ClubID='".$club."'";

            }
        }

        //Check if a Student ID was entered
        if (!empty($_POST['studid'])){
            $studid = escapeData($_POST['studid']);
            $searchQuery = $searchQuery." AND s.StudentID='".$studid."'"; //Add condition for the student ID to the query
        } else {
            $searchQuery = $searchQuery." AND s.StudentID IS NOT NULL"; //Add condition to query ensuring that there is a Student ID for the student
        }

        //Check if a first name was entered
        if (!empty($_POST['studfname'])){
            $studfname = escapeData($_POST['studfname']);
            $searchQuery = $searchQuery." AND s.FName LIKE '".$studfname."%'"; //Add condition for the student's first name to the query
        }

        //Check if a last name was entered
        if (!empty($_POST['studlname'])){
            $studlname = escapeData($_POST['studlname']);
            $searchQuery = $searchQuery." AND s.LName LIKE '".$studlname."%'"; //Add condition for the student's last name to the query
        }

        //Check if a year level was entered
        if (!empty($_POST['yearlevel'])){
            $yearlevel = escapeData($_POST['yearlevel']);
            if ($yearlevel != '--- select the year level ---'){//since the drop down box automatically has data, check if an actual year level was selected
                $searchQuery = $searchQuery." AND s.YearLevelID='".$yearlevel."'"; //Add condition for the year level to the query
            }
        }

        //Check if a date of birth was entered
        if (!empty($_POST['birthdate'])){
            $birthResult = escapeData($_POST['birthdate']);
            $date = str_replace('/', '-', $birthResult);
            $birthdate = date('Y-m-d', strtotime($date));
            $range = escapeData($_POST['range']);//Add condition for range of the date of birth to the query
            $searchQuery = $searchQuery." AND s.BirthDate".$range."'".$birthdate."'";//Add condition for the date of birth to the query
        }

        $searchQuery = $searchQuery." ORDER BY s.StudentID;"; //Add condition to sort the result in ascending by order by student ID's

        //echo 'Query: '.$searchQuery;

        $searchResult = mysqli_query($dbcon, $searchQuery); //Run query

        $snum = mysqli_num_rows($searchResult); //Determine how many students were found

        if ($snum > 0){//If there were any students found
            echo "<p align='center'><b>".$snum."</b> student(s) were found</p>"; //Print message showing how many students were found

            //Display table showing the students that were found and their data
            echo '<table align="center" cellspacing="0" cellpadding="5" border="1">
            <tr><td align="left"><b>Student ID</b></td><td align="left"><b>Student Name</b></td><td align="left"><b>Year Level</b></td><td align="left"><b>Date of Birth</b></td>';
            
            while ($row = mysqli_fetch_array($searchResult)){//Display each student found
                echo '<tr><td align="left">' . $row['StudentID'] . '</td><td align="left">' . $row['studName'] . '</td><td align="left">' . $row['YearLevelName'] . '</td><td align="left">' . $row['BirthDate'] . '</td></tr>';
            }
    
            echo '</table>';
    
            mysqli_free_result($searchResult);//Free the result of the query
        } else {//If no students were found
            //Display message
            echo '<p class="error" align="center">No students were found in the search.</p>';
        }//end of if(num > 0)

        mysqli_close($dbcon);

} // end of if (isset($_POST['submitted']))
?>
<!-- end of searchforstudent.php-->