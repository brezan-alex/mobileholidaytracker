<?php
include 'databases/holiday.php';

$queryResult = $conn -> query("SELECT * FROM holiday_type");

$res = array();

while($fetchData = $queryResult -> fetch_assoc()){
	$res[] = $fetchData;
}

echo json_encode($res);

?>