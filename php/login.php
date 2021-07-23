<?php
include 'databases/users.php';

$username = $_POST['user'];
$password = $_POST['pass'];
#$username = 'alex';
#$password = '123';

$queryResult = $conn -> query("SELECT user_id, username FROM users WHERE username='".$username."' and password='".$password."'");

$res = array();

while($fetchData = $queryResult -> fetch_assoc()){
	$res[] = $fetchData;
}

echo json_encode($res);

?>