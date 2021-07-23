<?php
include 'databases/holiday.php';

$holiday_id = mysqli_real_escape_string($conn, $_POST['holiday_id']);
#$holiday_id = "6";

$sql = <<<EOD
DELETE FROM `current_year_holiday_archive`
WHERE `current_year_holiday_archive`.`holiday_id` = {$holiday_id}
EOD;
if ($conn -> query($sql) === TRUE) {
echo "deleted successfully";
}else{
	echo "delete failed";
}

$conn -> close();
header('Type: json');
?>