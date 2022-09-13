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
$sql1 = "select * from answer";
$q_result = mysqli_query($con, $sql1);


if (!$q_result) {
    printf("Error: %s\n", mysqli_error($con));
    exit();
}


while ($q_row = mysqli_fetch_array($q_result)) {

    $q_id_each = $q_row["answer_id"];
    $q_content_each = $q_row["content"];
    $q_createtime_each = $q_row["createtime"];
    $q_user_id = $q_row["user_id"];


    $sql3 = "select * from user where user.user_id= '$q_user_id'";
    $u_result = mysqli_query($con, $sql3);
    while ($u_row = mysqli_fetch_array($u_result)) {
        $user_name = $u_row["nickname"];
        $img_path = $u_row["img_path"];
    }

    $arr_each = array("answer_id" => $q_id_each, "img_path" => $img_path, "createtime" => $q_createtime_each, "content" => $q_content_each, "username" => $user_name);
    $arr[] = $arr_each;
}

// print_r($arr);

echo json_encode($arr);
mysqli_close($con);
