<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>老师介绍页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
<link href="css/my_style.css" rel="stylesheet" type="text/css">
   
    <script>
        function showSite(str) {
            if (str == "") {
                document.getElementById("txtHint").innerHTML = "";
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
                    document.getElementById("txtHint").innerHTML = xmlhttp.responseText;
                }
            }
            xmlhttp.open("GET", "老师介绍信息.php?q=" + str+"&t="+ Math.random(), true);
            xmlhttp.send();
        }
    </script>
</head>

<body>
<div style="padding: 10px 10px 10px;">
<div class="b-example-divider"></div>
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

$sql = "SELECT * FROM teacher where course_id='" . $q . "'";

$result = mysqli_query($con, $sql);
?>		

<div class="row">
  <div class="column all">
	  <h2></h2>
<form>
    <select name="users" onchange="showSite(this.value)">
       <p>请选择一位老师：</p>
        <option value="">选择一位老师:</option> 
  <?php        
			while ($row = mysqli_fetch_array($result)) {
	?>
        <option value="<?php echo $row['teacher_id']; ?>"><?php echo $row['teacher_name']; ?></option>
<?php         
}
mysqli_close($con);
?>		
    </select>
</form>
<br>
<div id="txtHint"><b>老师信息显示在这里……</b></div>
<!--   <div class="b-example-divider"></div>-->
		</div>
</div>
</body>
</html>