<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>个人中心</title>
<link href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.mini.js"></script>
<script type="text/javascript" src="../js/post_question.js"></script>
<script type="text/javascript" src="/end/js/jquery-1.7.1.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
  <link href="css/user.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="back-btn" style="width: 100px;height: 40px;cursor:pointer;border: 1px solid rgb(78, 144, 243);
    background-color: rgb(78, 144, 243);
    color: #fff;">回到首页</div>
<div style="padding: 100px 10px 100px;">
<ul>
  <li><a href="个人中心.php"><h2>个人中心</h2></a></li>
  <li><a class="active"  href="个人中心.php">个人信息</a></li>
  <li><a href="#">我的提问</a></li>
  <li><a href="#">我的资源</a></li>
  <li><a href="#">我的笔记</a></li>
</ul>

<div style="margin-left:15%;padding:1px 16px;height:1000px;">
 <?php
$q = isset($_GET["q"]) ? intval($_GET["q"]) : '';
$con = mysqli_connect('localhost', 'root', '123456');
if (!$con) {
    die('Could not connect: ' . mysqli_error($con));
}
// 选择数据库
mysqli_select_db($con, "web_homework");
// 设置编码，防止中文乱码
mysqli_set_charset($con, "utf8");

	#####需要和登录界面参数传递#####
//获取网址参数 
$canshu= $_SERVER["QUERY_STRING"] ;
//$id = $arr['user_id'];
//echo $canshu;
$sql = "SELECT * FROM user where " . "$canshu";
//$user_id=20191003143;
//print_r($sql);
$result = mysqli_query($con, $sql);

while ($row = mysqli_fetch_array($result)) {
	?>
<div class="row">

  <div class="column left">
    <img src="image/img_user/<?php echo $row['img_path']; ?>" class="mx-auto d-block" style="width:32px;border-radius: 10px" >	
    
<!--    <h2 class="text-center">个人信息：</h2>-->
<!--     <a class="nav-link" href="javascript:void(0)" id="uploadfile">上传资源 </a>-->

	 <div class="d-grid">
	 
<center>
<button type="button" class="bt" style="margin: 20px 10px 20px 0px"><a href="javascript:void(0)" style="text-decoration:none" id="uploadimg">上传新头像</a></button>
</center>
		 <form id="submit_form" method="post" action="上传头像.php?id=<?php echo $row['user_id']; ?> " target="exec_target" enctype="multipart/form-data">
	         <input type="file" name="uploadfile" id="upload_file" style="display:none">        
	   <!-- 添加上传文件 -->
	</form>
	  </div>
		 
     <div class="d-grid"> 
<center>
 <button type="button" class="bt btn-block" style="margin: 20px 10px 20px 0px"><a href="update.php?id=<?php echo $row['user_id']; ?> " style="text-decoration:none">修改个人信息</a></button>
</center>
  </div>
  
     </div>
  <div class="column right">	
	 <div class="list-group" style="float:left;" >
	<!-- style="float:left;"-->
	  <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
	   <img src="image/img_logo/网站logo.jpg" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
		<div class="d-flex gap-2 w-100 justify-content-between">
		  <div>
			<h6 class="mb-0">我的账号----------------------------------------</h6>
			<p class="mb-0 opacity-75"><?php echo $row['user_id']; ?></p>
		  </div>
		  <small class="opacity-50 text-nowrap">now</small>
		</div>
	  </a>
	  <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
	   <img src="image/img_logo/网站logo.jpg" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
		<div class="d-flex gap-2 w-100 justify-content-between">
		  <div>
			<h6 class="mb-0">我的昵称----------------------------------------</h6>
			<p class="mb-0 opacity-75"><?php echo $row['nickname']; ?></p>
		  </div>
		  <small class="opacity-50 text-nowrap">now</small>
		</div>
	  </a>
	  <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
		<img src="image/img_logo/网站logo.jpg" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
		<div class="d-flex gap-2 w-100 justify-content-between">
		  <div>
			<h6 class="mb-0">我的金币----------------------------------------</h6>
			<p class="mb-0 opacity-75"><?php echo $row['user_coin']; ?></p>
		  </div>
		  <small class="opacity-50 text-nowrap">now</small>
		</div>
	  </a>
	 <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
	   <img src="image/img_logo/网站logo.jpg" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
		<div class="d-flex gap-2 w-100 justify-content-between">
		  <div>
			<h6 class="mb-0">我的年龄----------------------------------------</h6>
			<p class="mb-0 opacity-75"><?php echo $row['age']; ?></p>
		  </div>
		  <small class="opacity-50 text-nowrap">now</small>
		</div>
	  </a>
	  <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
		<img src="image/img_logo/网站logo.jpg" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
		<div class="d-flex gap-2 w-100 justify-content-between">
		  <div>
			<h6 class="mb-0">我的专业----------------------------------------</h6>
			<p class="mb-0 opacity-75"><?php echo $row['major']; ?></p>
		  </div>
		  <small class="opacity-50 text-nowrap">now</small>
		</div>
	  </a>
	   <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
	   <img src="image/img_logo/网站logo.jpg" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
		<div class="d-flex gap-2 w-100 justify-content-between">
		  <div>
			<h6 class="mb-0">我的学校----------------------------------------</h6>
			<p class="mb-0 opacity-75"><?php echo $row['school']; ?></p>
		  </div>
		  <small class="opacity-50 text-nowrap">now</small>
		</div>
	  </a>
	  <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
		<img src="image/img_logo/网站logo.jpg" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
		<div class="d-flex gap-2 w-100 justify-content-between">
		  <div>
			<h6 class="mb-0">我的年级----------------------------------------</h6>
			<p class="mb-0 opacity-75"><?php echo $row['grade']; ?></p>
		  </div>
		  <small class="opacity-50 text-nowrap">now</small>
		</div>
	  </a>
	</div>

	  <?php
	}
	//echo "</table>";

	mysqli_close($con);
	?>		
	  </div>
  
</div> 
  
  
</div>
</div>
<script>
//  $('.toolbar-top').load('../homework/web/toolbar.html');
	$('.back-btn').click(function(){
		window.location.href="../homework/web/index.html";
	})
 $("#uploadimg").click(function(){  
        document.getElementById("upload_file").click();
		
            });

 $(document).ready(function(){
     //选择文件成功则提交表单
     $("#upload_file").change(function(){
         if($("#upload_file").val() != '') $("#submit_form").submit();
     });

 });
</script>
</body>
</html>