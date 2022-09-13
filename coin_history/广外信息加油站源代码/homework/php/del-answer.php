<?php
header('Content-Type:application/json');  //此声明非常重要
$con = mysqli_connect("localhost", "root", "123456");

mysqli_select_db($con, "web_homework");
$q_id = $_POST['answer_id'];
$sql = "delete from answer where answer_id='$q_id'";
$result = mysqli_query($con, $sql);

mysqli_close($con);
