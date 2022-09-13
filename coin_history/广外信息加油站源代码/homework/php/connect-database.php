  <?php
  $con = mysqli_connect("localhost", "root", "123456");
  if (!$con) {
    echo '<script language="JavaScript">;alert("数据库连接失败！")</script>;';
  } else {
    echo '<script language="JavaScript">;alert("数据库连接成功！")</script>;';
  }
  ?>
