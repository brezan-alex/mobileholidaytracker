<?php
include 'databases/holiday.php';

	$employee_id = mysqli_real_escape_string($conn, $_POST['employee_id']);
    $sdate = mysqli_real_escape_string($conn, $_POST['start_date']);
    $edate = mysqli_real_escape_string($conn, $_POST['end_date']);
	$nr_of_holidays = mysqli_real_escape_string($conn, $_POST['nr_of_holidays']);
	$holiday_type_id = mysqli_real_escape_string($conn, $_POST['holiday_type_id']);
 
        $query = "INSERT INTO current_year_holiday_archive (employee_id, nr_of_holidays, holiday_type_id, start_date, end_date)
  			  VALUES('$employee_id','$nr_of_holidays','$holiday_type_id', '$sdate', '$edate')";
    $results = mysqli_query($conn, $query);
    if($results>0)
    {
        echo json_encode("date added successfully");
    }
?>