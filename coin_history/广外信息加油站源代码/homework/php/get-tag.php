<?php
header('Content-Type:application/json');  //此声明非常重要
$con = mysqli_connect("localhost", "root", "123456");

mysqli_select_db($con, "web_homework");
$tag_type = $_POST['tag_type'];
$sql = "select tag_id,tag_name from tag where tag_type ='$tag_type'";
$result = mysqli_query($con, $sql);
if (!$result) {
    printf("Error: %s\n", mysqli_error($con));
    exit();
}
$arr = array();
while ($row = mysqli_fetch_array($result)) {
    $arr_each = array("tag_id" => $row['tag_id'], "tag_name" => $row['tag_name']);
    $arr[] = $arr_each;
}
echo json_encode($arr);
mysqli_close($con);
