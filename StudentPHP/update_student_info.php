<?php
    $pagetitle = 'Update Student Information';//Page Title

    include ('include/header.php');//Page Header
    include('include/menu.php');//Page Menu

    //Start of update_student_info.php

    //function to retrieve the data from the form
    function escapeData ($data) {
        global $dbc;

        if(ini_get('magic_quotes_gpc')) {
            $data = stripslashes($data);
        }

        return mysqli_real_escape_string(mysqli_connect(HOST, USER, PASSWORD), trim($data));
    }

    
    if (isset($_POST['submitted2'])){//If the second form in the update screen was submitted correctly
        require_once ('connect_to_mysql.php');
        
        //Check if a Student ID was entered
        if (!empty($_REQUEST['student_id'])){
            $sid = escapeData($_POST['student_id']);
        } else {//If a student ID was not entered, an error message is displayed
            echo "<h1 class='mainhead'>Error!!!</h1>";
            echo "<p align='center'>There was no student ID submitted</p>";
        }
            //The update query for the student table is created - adding the conditions depending on what data was entered into the form. The default condition is changing the student ID to the current ID
            $updateQuery = "UPDATE student SET StudentID='".$sid."'";

            //Check if a first name was entered
            if (!empty($_POST['studfname'])){
                $studfname = escapeData($_POST['studfname']);
                $updateQuery = $updateQuery.", FName = '".$studfname."'";//Add condition for the student's first name to the query
            }

            //Check if a last name was entered
            if (!empty($_POST['studlname'])){
                $studlname = escapeData($_POST['studlname']);
                $updateQuery = $updateQuery.", LName = '".$studlname."'";//Add condition for the student's last name to the query
            }
    
            //Check if a year level was entered
            if (!empty($_POST['yearlevel'])){
                $yearlevel = escapeData($_POST['yearlevel']);
                if ($yearlevel != '--- select the year level ---'){//since the drop down box automatically has data, check if an actual year level was selected
                    $updateQuery = $updateQuery.", YearLevelID = '".$yearlevel."'";//Add condition for the year level to the query
                }
            }

            //Check if a date of birth was entered
            if (!empty($_POST['birthdate'])){
                $birthResult = escapeData($_POST['birthdate']);
                $date = str_replace('/', '-', $birthResult);
                $birthdate = date('Y-m-d', strtotime($date));
                $updateQuery = $updateQuery.", BirthDate = '".$birthdate."'";//Add condition for the date of birth to the query
            }

            $updateQuery = $updateQuery." WHERE StudentID ='".$sid."';";

            $updateResult = mysqli_query($dbcon, $updateQuery); //Run the student table update query

            $emailResult = $updateResult; //The result of the student table update query is set as the result of the student email table update query by default

            //Check if a current email and a new email was entered
            if ((!empty($_POST['email'])) && (!empty($_POST['newemail']))){
                $email = escapeData($_POST['email']);
                $newemail = escapeData($_POST['newemail']);
                if ($email != '--- select the email to be changed ---'){//since the drop down box automatically has data, check if an actual current email was selected
                    $emailQuery = "UPDATE studentemail SET Email='".$newemail."' WHERE Email='".$email."';";//Create query to update student email table
                    $emailResult = mysqli_query($dbcon, $emailQuery);//Run the student email update query
                    $updateResult = $emailResult;//The result of the query is set as the result of the student table update query
                } else {
                    echo'<p align="center">You have not selected a current email!</p><p><br /><p align="center">Please retry!</p>';
                    exit();
                }
            }

            if ($updateResult && $emailResult){//Check if both queries ran correctly
                //Display a message to show success
                    echo '<h1 id="mainhead">Success!</h1>
                <p align="center">The information has been successfully updated!</p><p><br /></p>';
                exit();
            } else {//If either queries did not run
                //Display error message
                    echo '<h1 id="mainhead">System Error</h1>
                <p class="error">The information could not be updated due to a system error. We apologize for any inconvenience.</p>';

                //Show query that did not run
                if(!$updateResult){
                    echo '<p>' . mysqli_error($dbcon) . '<br /><br />Query: '.$updateQuery.'</p>';
                }
                if(!$emailResult){
                    echo '<p>' . mysqli_error($dbcon) . '<br /><br />Query: '.$emailQuery.'</p>';
                }

                exit();
            }//end of if ($updateResult && $emailResult)
            mysqli_close($dbcon);//Disconnect from database
    }//end of if (isset($_POST['submitted2']))
?>
<!-- end of update_student_info-->