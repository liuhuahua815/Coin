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
$data = file_get_contents("php://input");
$data = json_decode($data, TRUE);
$note_title =  $data['note_title'];
$note_content = $data['note_content'];
$note_intro =  $data['note_intro'];
$user_id =     $data['user_id'];


$sql = "insert into note(note_title,note_content,note_intro,user_id) values('$note_title','$note_content','$note_intro','$user_id')";
$result = mysqli_query($con, $sql);
if (!$result) {
    printf("Error: %s\n", mysqli_error($con));
    exit();
}
$sql1 =  "select * from note where note.note_content = '$note_content'";
$result1 = mysqli_query($con, $sql1);
while ($row = mysqli_fetch_array($result1)) {
    $createtime = $row['createtime'];
    $note_id = $row['note_id'];
}

$sql2 = "select * from user where user.user_id ='$user_id'";
$result2 = mysqli_query($con, $sql2);
while ($row = mysqli_fetch_array($result2)) {
    $img_path = $row['img_path'];
    $user_name = $row['nickname'];
}

$array = array('note_id' => $note_id, "img_path" => $img_path, "username" => $user_name, "createtime" => $createtime);
echo json_encode($array);
mysqli_close($con);
