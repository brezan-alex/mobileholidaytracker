<?php
include 'databases/holiday.php';

$id  = $_POST['employee_id'];
#$id = 0;

$sql = <<<EOD
SELECT holiday_id, employee_id, start_date, end_date, first_name, holiday_type
FROM current_year_holiday_archive
JOIN employees e USING(employee_id)
JOIN holiday_type USING(holiday_type_id)
WHERE e.employee_id = '{$id}'
EOD;
$res = $conn -> query($sql);
$out = array();
if($res -> num_rows > 0) {
	while($row = $res -> fetch_assoc()) {
		array_push($out,$row);		
	}
}
$conn -> close();
header('Type: json');
echo json_encode($out);

?>