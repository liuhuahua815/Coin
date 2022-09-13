<?php
// header('Content-Type:application/json');  //此声明非常重要
$con = mysqli_connect("localhost", "root", "123456");

mysqli_select_db($con, "web_homework");
$sql = "SELECT resource_path FROM resource where user_id!=0 and display!=1";
$result = mysqli_query($con, $sql);
if (!$result) {
    printf("Error: %s\n", mysqli_error($con));
    exit();
}
$arr = array();
while ($row = mysqli_fetch_array($result)) {
    $arr_each = array("resource_path" => $row["resource_path"]);
    $arr[] = $arr_each;
}
echo json_encode($arr);
mysqli_close($con);
