<?php
header('Content-Type:application/json');  //此声明非常重要
$con = mysqli_connect("localhost", "root", "123456");
if (!$con) {
    //        echo '<script language="JavaScript">;alert("数据库连接失败！")</script>;';
} else {
    //        echo '<script language="JavaScript">;alert("数据库连接成功！")</script>;';
}
mysqli_select_db($con, "web_homework");
// $data= file_get_contents("php://input");
//  $data = json_decode($data,TRUE);
//  print_r($data);

$q_id =   $_POST['q_id'];
$content = $_POST['content'];
$user_id = $_POST['user_id'];


$sql = "INSERT INTO answer (q_id,content,user_id) values('$q_id','$content','$user_id') ";
$result = mysqli_query($con, $sql);
if (!$result) {
    printf("Error: %s\n", mysqli_error($con));
    exit();
}
$sql1 =  "select * from answer where answer.content = '$content'";
$result1 = mysqli_query($con, $sql1);
while ($row = mysqli_fetch_array($result1)) {
    $createtime = $row['createtime'];
}

$sql2 = "select * from user where user.user_id ='$user_id'";
$result2 = mysqli_query($con, $sql2);
while ($row = mysqli_fetch_array($result2)) {
    $img_path = $row['img_path'];
    $user_name = $row['nickname'];
}

$array = array('q_id' => $q_id, 'content' => $content, 'user_id' => $user_id, "img_path" => $img_path, "username" => $user_name, "createtime" => $createtime);
echo json_encode($array);
mysqli_close($con);
