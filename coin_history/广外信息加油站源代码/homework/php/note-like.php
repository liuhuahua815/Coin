<?php
// header('Content-Type:application/json');  //此声明非常重要
$con = mysqli_connect("localhost", "root", "123456");

mysqli_select_db($con, "web_homework");
$user_id = $_POST['user_id'];
$note_id = $_POST['note_id'];


$sql = "insert into like_n(user_id,note_id) values ('$user_id','$note_id')";
$result = mysqli_query($con, $sql);
if (!$result) {
    printf("Error: %s\n", mysqli_error($con));
    exit();
}
$sql1 = "select like_id from like_n where like_n.user_id='$user_id' and like_n.note_id ='$note_id'";
$result1 = mysqli_query($con, $sql1);
while ($row = mysqli_fetch_array($result1)) {
    $like_id = $row['like_id'];
}
$arr = array("like_id" => $like_id);
echo json_encode($arr);
mysqli_close($con);
