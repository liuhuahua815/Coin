<?php
// header('Content-Type:application/json');  //此声明非常重要
$con = mysqli_connect("localhost", "root", "123456");

mysqli_select_db($con, "web_homework");
$user_id = $_POST['user_id'];
$note_id = $_POST['note_id'];


$sql = "delete from collect_n where user_id='$user_id' and note_id= '$note_id'";
$result = mysqli_query($con, $sql);
if (!$result) {
    printf("Error: %s\n", mysqli_error($con));
    exit();
}
mysqli_close($con);
