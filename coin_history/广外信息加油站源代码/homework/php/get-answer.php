<?php
header('Content-Type:application/json');  //此声明非常重要
$con = mysqli_connect("localhost", "root", "123456");

mysqli_select_db($con, "web_homework");
$q_id = $_POST['q_id'];
$sql = "SELECT answer.*,user.`img_path`,user.`nickname` FROM USER,answer WHERE answer.`q_id`='$q_id' AND answer.`user_id`=user.`user_id`";
$result = mysqli_query($con, $sql);
if (!$result) {
    printf("Error: %s\n", mysqli_error($con));
    exit();
}
$arr = array();
while ($row = mysqli_fetch_array($result)) {
    $arr_each = array("username" => $row["nickname"], "createtime" => $row["createtime"], "content" => $row["content"], "img_path" => $row["img_path"]);
    $arr[] = $arr_each;
}
echo json_encode($arr);
mysqli_close($con);
