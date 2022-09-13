  <?php
    //    header('Content-Type:application/json');  //此声明非常重要
    $con = mysqli_connect("localhost", "root", "123456");
    if (!$con) {
        //        echo '<script language="JavaScript">;alert("数据库连接失败！")</script>;';
    } else {
        //        echo '<script language="JavaScript">;alert("数据库连接成功！")</script>;';
    }
    mysqli_select_db($con, "web_homework");
    $data = file_get_contents("php://input");
    $data = json_decode($data, TRUE);
    // print_r($data);

    $q_title = $data['q_title'];
    $q_content = $data['q_content'];
    $user_id = $data['user_id'];
    $tag_group = $data['tag_group'];

    $sql = "INSERT INTO question (q_title,q_content,user_id) values('$q_title','$q_content','$user_id') ";
    $result = mysqli_query($con, $sql);

    $sql2 = "select q_id from question where q_title='$q_title'";
    $result2 =  mysqli_query($con, $sql2);

    while ($row = mysqli_fetch_array($result2)) {
        $q_id = $row['q_id'];
    }
    foreach ($tag_group as $value) {
        $sql = "insert into tag_question (q_id,tag_id) values($q_id,$value)";
        mysqli_query($con, $sql);
    }



    //    echo '<script language="JavaScript">;alert("进入了PHP页面里的");</script>;';
    $array = array('q_title' => $q_title, 'q_content' => $q_content);
    //这里进行一个些操作，比如数据库交互 
    //    echo  '[{"q_tilte":"df df","q_content":"dfdfdfds"}]'; //json_encode方式是必须的
    echo json_encode($array);
    mysqli_close($con);
    ?>
