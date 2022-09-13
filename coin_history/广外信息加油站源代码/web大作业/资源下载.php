<!DOCTYPE html>
<?php 
require_once("conn.php");
?>

<html>
<head>
<meta charset="utf-8">
<title>资源下载</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
.underline{text-decoration:none}
</style>
</head>
<body>
	
	
 <?php
$q = isset($_GET["q"]) ? intval($_GET["q"]) : '';
$id = isset($_GET["id"]) ? intval($_GET["id"]) : '';
	
if (empty($q)) {
    echo '请选择一个资源类型';
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
	#####(bu)需要和登录界面参数传递user_id#####
$sql_coin = "SELECT * FROM user where  user_id='{$_GET['id']}'";
$result_coin = mysqli_query($con, $sql_coin);	
$row_coin = mysqli_fetch_array($result_coin);
	if($row_coin['user_coin']<=0){
				?>
<!--
<script>
     alert('抱歉，你的下载资源金币数不足！请通过上传资源获取金币数！');
     window.location.href="课程介绍.php"
	</script>
-->
<li class="list-group-item"><p class="text-danger">抱歉，你的下载资源金币数不足！请通过上传资源获取金币数！</p></li>
<?php	
	}
	else{
$sql = "SELECT * FROM resource where  resource_type='" . $q . "' and display=1" ;
//course_id='" . $q . "' and
$result = mysqli_query($con, $sql);
$num=mysqli_num_rows($result);	
?>

<h6>点击链接下载资源：</h6>
<div class="container mt-3">
	<ul class="list-group">
	<?php		

if ($num== "0")	{
	?>
	<li class="list-group-item">该课程无此类资源</li>
 <?php
}
else {
	while($row = mysqli_fetch_array($result)){
	?>
	<li class="list-group-item"><button><a href="大学学习资源/<?php echo $row['resource_path']; ?>"  download="<?php echo $row['resource_path']; ?>" class="underline"  id="updatecoin"><?php echo $row['resource_path']; ?>------------------------点击下载</a></button></li>
	
 <?php
}
}
	}
mysqli_close($con);
?>		
  
 </ul>
</div>
<script type="text/javascript">
$("#updatecoin").click(function(){
  alert('下载成功！');
	   console.log($(this).html());
     <?php    
	#####需要和登录界面参数传递user_id#####
//		       $id='1';
//	          $id=$_POST['user_id'];
	             mysqli_query($conn,"update user set user_coin=user_coin-1 where user_id =$id");
		?>
 });
</script>

</body>
</html>