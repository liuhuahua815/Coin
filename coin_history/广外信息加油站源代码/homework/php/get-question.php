<?php
header('Content-Type:application/json');  //此声明非常重要
$con = mysqli_connect("localhost", "root", "123456");

mysqli_select_db($con, "web_homework");
$q_id = $_POST['q_id'];
$sql = "select question.*,user.* from question,user where user.user_id=question.user_id and question.q_id = '$q_id'";
$result = mysqli_query($con, $sql);
if (!$result) {
    printf("Error: %s\n", mysqli_error($con));
    exit();
}
$arr = array();
while ($row = mysqli_fetch_array($result)) {
    $q_title_each = $row['q_title'];
    $q_content_each = $row['q_content'];
    $q_createtime_each = $row['createTime'];
    $user_name = $row['nickname'];
    $img_path = $row['img_path'];
    $user_id = $row["user_id"];
}
$sql2 = "SELECT t.`tag_name` FROM tag_question AS tq LEFT JOIN tag AS t ON tq.`tag_id`=t.`tag_id` WHERE tq.`q_id` = '$q_id '";
$t_result = mysqli_query($con, $sql2);
$tag_arr = array();
while ($t_row = mysqli_fetch_array($t_result)) {
    $tag_arr[] = $t_row["tag_name"];
}
$arr = array("q_id" => $q_id, "q_title" => $q_title_each, "q_content" => $q_content_each, "createTime" => $q_createtime_each, "tags_name" => $tag_arr, "user_name" => $user_name, "img_path" => $img_path, "user_id" => $user_id);
echo json_encode($arr);
mysqli_close($con);
