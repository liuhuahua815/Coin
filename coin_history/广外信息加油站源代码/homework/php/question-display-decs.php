<?php
header('Content-Type:application/json');  //此声明非常重要
$con = mysqli_connect("localhost", "root", "123456");
if (!$con) {
    //            echo '数据库连接失败!';
    //			echo "\n";
} else {
    //            echo '数据库连接成功!';
    //				echo "\n";
}
mysqli_select_db($con, "web_homework");
$arr = array();
$sql1 = "SELECT * FROM question  ORDER BY createTime DESC;";
$q_result = mysqli_query($con, $sql1);


if (!$q_result) {
    printf("Error: %s\n", mysqli_error($con));
    exit();
}


while ($q_row = mysqli_fetch_array($q_result)) {

    $q_id_each = $q_row["q_id"];
    $q_title_each = $q_row["q_title"];
    $q_content_each = $q_row["q_content"];
    $q_createtime_each = $q_row["createTime"];
    $q_user_id = $q_row["user_id"];

    $sql2 = "SELECT t.`tag_name` FROM tag_question AS tq LEFT JOIN tag AS t ON tq.`tag_id`=t.`tag_id` WHERE tq.`q_id` = '$q_id_each'";
    $t_result = mysqli_query($con, $sql2);
    $tag_arr = array();
    while ($t_row = mysqli_fetch_array($t_result)) {
        $tag_arr[] = $t_row["tag_name"];
    }
    $sql3 = "select * from user where user.user_id= '$q_user_id'";
    $u_result = mysqli_query($con, $sql3);
    while ($u_row = mysqli_fetch_array($u_result)) {
        $user_name = $u_row["nickname"];
    }

    $arr_each = array("q_id" => $q_id_each, "q_title" => $q_title_each, "q_content" => $q_content_each, "crateTime" => $q_createtime_each, "tags_name" => $tag_arr, "user_name" => $user_name);
    $arr[] = $arr_each;
}

// print_r($arr);

echo json_encode($arr);
mysqli_close($con);
