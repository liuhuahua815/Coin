<?php
$con = mysqli_connect("localhost", "root", "123456");
if (!$con) {
	$arr = array("message" => "数据库连接失败");
}
mysqli_select_db($con, "web_homework");
$nickname = $_POST['nickname'];
$password = $_POST['password'];

$sql1 = "select nickname from user";
$result1 = mysqli_query($con, $sql1);
$is_exist = false;
$arr = array();

while ($row = mysqli_fetch_array($result1)) {
	if ($row['nickname'] == $nickname) {
		$is_exist = true;
	}
	//	print_r("row" . $row['nickname']);
}
if (!$is_exist) {
	$arr["message"] = "用户不存在";
} else {
	$sql = "SELECT * FROM user WHERE nickname = '$nickname' AND password = '$password'";
	$result = mysqli_query($con, $sql);
	$count = mysqli_num_rows($result);

	if ($count == 0) {
		$arr["message"] = "密码错误";
	} else {
		while ($row = mysqli_fetch_array($result)) {
			$arr["message"] = "用户存在";
			$arr["imgpath"] = $row["img_path"];
			$arr["username"] = $row["nickname"];
			$arr["userid"] = $row["user_id"];
		}
	}
}
//print_r($arr);
echo json_encode($arr);
mysqli_close($con);
