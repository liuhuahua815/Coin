<!doctype html>
<html lang="en">
<head>
    <LINK REL="stylesheet" TYPE="text/css" HREF="example.css">
    <meta charset="utf-8">
    <title>upload</title>
</head>
<body>



<PRE>

<?php
print_r($_REQUEST);
print_r($_FILES);
//copy($_FILES['uploadfile']['tmp_name'],$_FILES["uploadfile"]["name"]);
//move_uploaded_file($_FILES['uploadfile']['tmp_name'], $_FILES["uploadfile"]["name"]);



$UploadPath = "./大学学习资源/";
$source_filename = $_FILES['uploadfile']['tmp_name'];
$dest_filename = $UploadPath . $_FILES["uploadfile"]["name"];
$new_resource=$_FILES["uploadfile"]["name"];		
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
	
	mysqli_query($con,"INSERT INTO `resource` (`course_id`, `resource_path`, `resource_type`, `resource_id`,`display`,`user_id`) VALUES
({$_GET['q']}, '$new_resource', NULL , NULL , 0 ,'{$_GET['id']}');");
	?>

<script>
     alert('文件已成功上传！待平台审核内容通过后即可成为平台共享资源并获得经验值,预计需要两个工作日，感谢您的分享！');
     window.location.href="急救箱home.html"
	</script>

<?php	
}

?>

</PRE>
</body>
</html>