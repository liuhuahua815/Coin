<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
  <link href="css/teacher.css" rel="stylesheet" type="text/css">
<title>老师介绍信息</title>
</head>
<body>
<?php
$q = isset($_GET["q"]) ? intval($_GET["q"]) : '';

if (empty($q)) {
    echo '请选择一个老师';
    exit;
}

$con = mysqli_connect('localhost', 'root', '123456');
if (!$con) {
    die('Could not connect: ' . mysqli_error($con));
}
// 选择数据库
mysqli_select_db($con, "web_homework");
// 设置编码，防止中文乱码
mysqli_set_charset($con, "utf8");

$sql = "SELECT * FROM teacher WHERE teacher_id = '" . $q . "'";

$result = mysqli_query($con, $sql);

while ($row = mysqli_fetch_array($result)) {
	?>
	<div style="padding: 10px 30px 10px;">
<div class="column left">

	<img src="image/img_teacher/<?php echo $row['teacher_img']; ?>" class="mx-auto d-block image"  style="width:300px">
	
</div>
	
<div class="column right">	
	<h3><?php echo $row['teacher_name']; ?></h3>
<p style="line-height:50px;" class="text-justify"><strong>教师介绍：</strong> </p> 
	<p class="text-justify"><?php echo $row['teacher_intro']; ?></p> 
</div>
<?php	
}
mysqli_close($con);
	?>
</body>
</html>


