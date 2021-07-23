<?php
$username="root";//dbh.php
$password="";
$host="localhost";
$db_name="sql_baum_holiday";

$conn=mysqli_connect($host,$username,$password,$db_name);

if($conn -> connect_error)
{
	die("Conenction failed: ".$conn -> connect_error);
	echo json_encode("Connection Failed");
	return;
}//dbh.php
?>