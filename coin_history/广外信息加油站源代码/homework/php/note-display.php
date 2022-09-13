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
$sql1 = "select * from note";
$q_result = mysqli_query($con, $sql1);


if (!$q_result) {
    printf("Error: %s\n", mysqli_error($con));
    exit();
}


while ($q_row = mysqli_fetch_array($q_result)) {

    $q_id_each = $q_row["note_id"];
    $q_title_each = $q_row["note_title"];
    $q_intro_each = $q_row["note_intro"];
    $q_content_each = $q_row["note_content"];
    $q_createtime_each = $q_row["createtime"];
    $q_user_id = $q_row["user_id"];

    $sql2 = "SELECT COUNT(note_id)AS like_num FROM like_n WHERE note_id ='$q_id_each'";
    $result2 = mysqli_query($con, $sql2);
    while ($row2 = mysqli_fetch_array($result2)) {
        $like_num = $row2["like_num"];
    }

    $sql3 = "SELECT COUNT(note_id)AS collect_num FROM collect_n WHERE note_id ='$q_id_each'";
    $result3 = mysqli_query($con, $sql3);
    while ($row3 = mysqli_fetch_array($result3)) {
        $collect_num = $row3["collect_num"];
    }

    $sql4 = "select * from user where user.user_id= '$q_user_id'";
    $u_result = mysqli_query($con, $sql4);
    while ($u_row = mysqli_fetch_array($u_result)) {
        $user_name = $u_row["nickname"];
    }

    $arr_each = array("like_num" => $like_num, "collect_num" => $collect_num, "n_user_id" => $q_user_id, "note_id" => $q_id_each, "note_title" => $q_title_each, "note_content" => $q_content_each, "createtime" => $q_createtime_each, "note_intro" =>  $q_intro_each, "user_name" => $user_name);
    $arr[] = $arr_each;
}

// print_r($arr);

echo json_encode($arr);
mysqli_close($con);
