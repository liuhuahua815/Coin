<!DOCTYPE html>
<?php 
require_once("conn.php");
?>
<html>
<head>
<meta charset="utf-8">
<title>课程介绍页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../css/post_question.css">
<script type="text/javascript" src="../js/jquery.mini.js"></script>
<script type="text/javascript" src="../js/post_question.js"></script>
<script type="text/javascript" src="/end/js/jquery-1.7.1.js"></script>
<link href="css/lesson.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="back-btn" style="width: 100px;height: 40px;cursor:pointer;border: 1px solid rgb(78, 144, 243);
    background-color: rgb(78, 144, 243);
    color: #fff;">回到首页</div>
<div style="padding: 100px 10px 100px;">	
<div style="padding: 10px 10px 10px;">

  <div class="b-example-divider bg-primary navbar-dark"></div>

		<?php
#####需要和登录界面参数传递user_id#####
$id=$_GET["user_id"];
$q = isset($_GET["q"]) ? intval($_GET["q"]) : '';
$con = mysqli_connect('localhost', 'root', '123456');
if (!$con) {
    die('Could not connect: ' . mysqli_error($con));
}
// 选择数据库
mysqli_select_db($con, "web_homework");
// 设置编码，防止中文乱码
mysqli_set_charset($con, "utf8");

$sql = "SELECT * FROM course where course_id='" . $q . "'";

$result = mysqli_query($con, $sql);
while ($row = mysqli_fetch_array($result)) {
	?>
<div class="row">
  <div class="column left">
    <img src="image/img_book/<?php echo $row['course_img']; ?>" class="mx-auto d-block" style="width:70%">	
  </div>
  
 <div class="column right">	
    <h2 ><?php echo $row['course_name']; ?></h2>
<!--    <h3></h3>-->
	<p style="line-height:50px;" class="text-justify"><strong>课程简介：</strong> </p> 
	<p class="text-justify"><?php echo $row['course_intro']; ?></p> 
	<p style="line-height:50px;" class="text-justify"><strong>授课老师：</strong></p> 
	<a class="text-justify" href="老师介绍.php?q=<?php echo $q; ?>"><p class="text-justify"><?php echo $row['course_teachers']; ?></p></a>
<!--	 window.location.href="老师介绍.php?q=" + str;-->
<!--      $row[link]-->
  <?php
}
mysqli_close($con);
?>		
	  </div>
  
</div>
 

<nav class="navbar navbar-expand-sm navbar-dark">
  <!-- Brand -->
  <a class="navbar-brand" href="#"><img src="image/img_logo/网站logo.jpg" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0"></a>
  <ul class="navbar-nav">
  <!-- Dropdown -->
	 <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="father" data-bs-toggle="dropdown">
        下载资源
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#" onClick="showResource(1)" class="coin">课堂PPT</a>
        <a class="dropdown-item" href="#" onClick="showResource(2)" class="coin">电子教材</a>
        <a class="dropdown-item" href="#" onClick="showResource(3)" class="coin">试卷/其他</a>
      </div>
    </li>
  <!-- Links -->
	<li class="nav-item">
	  <a class="nav-link" href="javascript:void(0)" id="uploadfile">上传资源 </a>
	 <form id="submit_form" method="post" action="upload1.php?q=<?php echo $q; ?>&id=<?php echo $id; ?>" target="exec_target" enctype="multipart/form-data">
	   <input type="file" name="uploadfile" id="upload_file" style="display:none">        
	   <!-- 添加上传文件 -->
	</form>
	</li>
<!--onClick="upload('upload1.html')"-->
  </ul>
</nav>
<br>
<!--资源显示在这里:<b></b>-->
<div id="resource">请选择资源类型</div>

<script>
$('.back-btn').click(function(){
		window.location.href="../homework/web/index.html";
	})
    $("#uploadfile").click(function(){  
        document.getElementById("upload_file").click();
		
            });

 $(document).ready(function(){
     //选择文件成功则提交表单
     $("#upload_file").change(function(){
         if($("#upload_file").val() != '') $("#submit_form").submit();
     });

 });	
function showResource(str) {
            if (str == "") {
                document.getElementById("resource").innerHTML = "";
                return;
            }
            if (window.XMLHttpRequest) {
                // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
                xmlhttp = new XMLHttpRequest();
            } else {
                // IE6, IE5 浏览器执行代码
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    document.getElementById("resource").innerHTML = xmlhttp.responseText;
                }
            }
            xmlhttp.open("GET", "资源下载.php?q=<?php echo $q; ?>" + str+"&id=<?php echo $id; ?>"+"&t="+ Math.random(), true);
            xmlhttp.send();
        }
    </script>
</body>
</html>