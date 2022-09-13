<?php
header('Content-Type:application/json');  //此声明非常重要
$con = mysqli_connect("localhost", "root", "123456");

mysqli_select_db($con, "web_homework");
$note_id = $_POST['note_id'];
$user_id = $_POST['user_id'];

$sql = "select note.*,user.* from note,user where user.user_id=note.user_id and note.note_id = '$note_id'";
$result = mysqli_query($con, $sql);
if (!$result) {
    printf("Error: %s\n", mysqli_error($con));
    exit();
}
$arr = array();
while ($row = mysqli_fetch_array($result)) {
    $note_title = $row['note_title'];
    $note_content = $row['note_content'];
    $note_intro = $row['note_intro'];
    $createtime = $row['createtime'];
    $user_name = $row['nickname'];
    $img_path = $row['img_path'];
    $note_user_id = $row["user_id"];
}
$sql1 = "SELECT COUNT(note_id)AS like_num FROM like_n WHERE note_id ='$note_id'";
$result1 = mysqli_query($con, $sql1);
while ($row1 = mysqli_fetch_array($result1)) {
    $like_num = $row1["like_num"];
}

$sql2 = "SELECT COUNT(note_id)AS collect_num FROM collect_n WHERE note_id ='$note_id'";
$result2 = mysqli_query($con, $sql2);
while ($row2 = mysqli_fetch_array($result2)) {
    $collect_num = $row2["collect_num"];
}
$sql3 = "select * from like_n where note_id='$note_id'and user_id='$user_id'";
$result3 = mysqli_query($con, $sql3);
$count = mysqli_num_rows($result3);
// echo "like count is: " . $count;
if ($count == 0) {
    $like_set = "false";
} else {
    $like_set = "true";
}
$sql4 = "select * from collect_n where note_id='$note_id'and user_id='$user_id'";
$result4 = mysqli_query($con, $sql4);
$count = mysqli_num_rows($result4);
// echo "collect count is: " . $count;
if ($count == 0) {
    $collect_set = "false";
} else {
    $collect_set = "true";
}
$arr = array("like_set" => $like_set, "collect_set" => $collect_set, "note_user_id" => $note_user_id, "like_num" => $like_num, "collect_num" => $collect_num, "note_title" => $note_title, "user_name" => $user_name, "note_content" => $note_content, "createtime" => $createtime, "img_path" => $img_path, "note_into" => $note_intro);
echo json_encode($arr);
mysqli_close($con);
