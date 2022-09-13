<!doctype html>

<?php 
require_once("conn.php");
?>
<html lang="en">
<head>
    <LINK REL="stylesheet" TYPE="text/css" HREF="example.css">
    <meta charset="UTF-8">
    <title>upload</title>
</head>
<body>



<PRE>

<?php
print_r($_REQUEST);
print_r($_FILES);
//copy($_FILES['uploadfile']['tmp_name'],$_FILES["uploadfile"]["name"]);
//move_uploaded_file($_FILES['uploadfile']['tmp_name'], $_FILES["uploadfile"]["name"]);



$UploadPath = "./image/img_user/";
$source_filename = $_FILES['uploadfile']['tmp_name'];
$dest_filename = $UploadPath . $_FILES["uploadfile"]["name"];
$new_img=$_FILES["uploadfile"]["name"];	
echo $source_filename,"\n";
echo $dest_filename,"\n";

if (file_exists($dest_filename)) {      
    echo $dest_filename . "已经存在";
} else {
    move_uploaded_file($source_filename, $dest_filename);
	$con = mysqli_connect('localhost', 'root', '123456');
	if (!$con) {
		die('Could not connect: ' . mysqli_error($con));
	}
	// 选择数据库
	mysqli_select_db($con, "web_homework");
	// 设置编码，防止中文乱码
	mysqli_set_charset($con, "utf8");
	mysqli_query($con,"update user set img_path='$new_img' where user_id ={$_GET['id']} ;");

		?>

<script>
     alert('头像更换成功！');
     window.location.href="个人中心.php?user_id="+<?php echo $_GET['id'] ?>
	</script>

<?php	  
}

?>

</PRE>
</body>
</html>