<?php
header('Content-Type:application/json');  //此声明非常重要
$con = mysqli_connect("localhost", "root", "123456");
if (!$con) {
    //        echo '<script language="JavaScript">;alert("数据库连接失败！")</script>;';
} else {
    //        echo '<script language="JavaScript">;alert("数据库连接成功！")</script>;';
}
mysqli_select_db($con, "web_homework");
$nickname = $_POST['nickname'];
$password = $_POST['password'];
$sql = "INSERT INTO user (nickname,password) values('$nickname','$password') ";
$result = mysqli_query($con, $sql);
//    echo "result" . $result;
$arr = array();
if ($result) {
    $arr['message'] = "用户数据成功存储至数据库";
} else {
    $arr['message'] = "用户数据存储失败";
}
echo json_encode($arr);
mysqli_close($con);
