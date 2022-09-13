<!doctype html>
<?php 
require_once("conn.php");
?>

<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
<title>修改</title>
</head>

<style>
	.bt{
		color:rgb(78,146,243);
		border: 3px solid rgb(78,146,243);
	}
	</style>
<body>
<div class="toolbar-top"></div>

<div class="container">
   <div style="padding: 100px 100px 10px;">
    <h3>修改个人信息：</h3>
	<form class="bs-example bs-example-form" role="form"  method="post">
	     <?php 
//		    $id = $_GET['user_id'];
		   $result=mysqli_query($conn,"select * from user where user_id={$_GET['id']} ;"); 
		  while($row =mysqli_fetch_array($result))
		  {?>
        <h6>我的账号:</h6>
		     <div class="input-group">
			   <input name="user_id" type="text" class="form-control" value="<?php echo $row['user_id']?>" readonly>
		   </div><br>
        
         <h6>我的昵称:</h6>
		     <div class="input-group">
			   <input name="nickname" type="text" class="form-control" placeholder="<?php echo $row['nickname']?>" >
		   </div><br>
         
          <h6>我的密码:</h6>
		     <div class="input-group">
			   <input name="password" type="text" class="form-control" placeholder="<?php echo $row['PASSWORD']?>" >
		   </div><br>
      
	      <h6>我的性别:</h6>
		  <div class="input-group">
			   <input name="sex" type="text" class="form-control" placeholder="<?php echo $row['sex']?>">
		   </div><br>
		   
		   <h6>我的年龄:</h6>
		    <div class="input-group">
			   <input name="age" type="text" class="form-control" placeholder="<?php echo $row['age']?>">
		   </div><br>
		   
		    <h6>我的学校:</h6>
		    <div class="input-group">
			   <input name="school" type="text" class="form-control" placeholder="<?php echo $row['school']?>">
		   </div><br>
		   
		   <h6>我的专业:</h6>
		    <div class="input-group">
			   <input name="major" type="text" class="form-control" placeholder="<?php echo $row['major']?>">
		   </div><br>
		<h6>我的年级:</h6>
		    <div class="input-group">
			   <input name="grade" type="text" class="form-control" placeholder="<?php echo $row['grade']?>">
		   </div><br>
		   
		   <button type="submit" class="btn btn-outline-info bt" onClick="insert()">确认</button>
		   <button type="button" class="btn btn-outline-info  btn-block bt"><a href="个人中心.php?user_id=<?php echo $row['user_id']?>" style="text-decoration:none">返回个人中心</a></button>
		<?php
			}
		?>
	</form>
	 
</div>
</div>

<script language='javascript'>
	
	function insert(){
		<?php
//		       $id='20191003143';
	          $id=$_POST['user_id'];
	          if($_POST['name']!=null){
	             $name=$_POST['name'];
	             mysqli_query($conn,"update user set nickname='$name' where user_id =$id");
               }
	
	         if($_POST['password']!=null){
	             $pwd=$_POST['pwd'];
	             mysqli_query($conn,"update user set PASSWORD='$pwd' where user_id =$id");
               }	
		
	         if($_POST['age']!=null){
	          $age=$_POST['age'];
	          mysqli_query($conn,"update user set age='$age' where user_id =$id");
             }	
              
		     if($_POST['major']!=null){
	          $major=$_POST['major'];
	          mysqli_query($conn,"update user set major='$major' where user_id =$id");
             }	
		
		     if($_POST['school']!=null){
	          $school=$_POST['school'];
	          mysqli_query($conn,"update user set school='$school' where user_id =$id");
             }	
              
		     if($_POST['sex']!=null){
	          $sex=$_POST['sex'];
	          mysqli_query($conn,"update user set sex='$sex' where user_id =$id");
             }	
		 if($_POST['grade']!=null){
	          $grade=$_POST['grade'];
	          mysqli_query($conn,"update user set grade='$grade' where user_id =$id");
             }	
		?>
		
	}
</script>

</body>
</html>