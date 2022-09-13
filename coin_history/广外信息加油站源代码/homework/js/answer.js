$(function () {
    function getParam(paramName) {
        paramValue = "", isFound = !1;
        if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=") > 1) {
            arrSource = unescape(this.location.search).substring(1, this.location.search.length).split("&"), i = 0;
            while (i < arrSource.length && !isFound) arrSource[i].indexOf("=") > 0 && arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase() && (paramValue = arrSource[i].split("=")[1], isFound = !0), i++
        }
        return paramValue == "" && (paramValue = null), paramValue
    }
    $('.toolbar-top').load('toolbar.html');
    $('.edit-answer-inner').load('editor-box.html');
    var q_id = getParam("q_id");
    var q_user_id;
    if (q_id != null) {
        // alert("获取参数:" + getParam("q_id"));
        // 根据q_id从数据库中取出问题的信息
        $.ajax({
            url: "../php/get-question.php",
            data: { "q_id": q_id },
            type: "POST",
            datatype: "json",
            success: function (result) {
                var imgpath = "../../web大作业/image/img_user/" + result.img_path;
                console.log("问题的img_path" + imgpath);
                console.log(result.user_name);
                $('#head-pic').attr('src', imgpath);
                $('#username').html(result.user_name);
                $('#ques_title').text(result.q_title);
                $('#createtime').text(result.createTime);
                // content的内容一定要通过HTML赋值，如果通过text，则不能用被渲染 
                $('#ques_content').html(result.q_content);
                tags_name = result.tags_name;
                var taghtml = " ";
                for (var j = 0; j < tags_name.length; j++) {
                    taghtml += "<div class='tag-each'> " + tags_name[j] + "</div>";
                }
                $('.tag').append(taghtml);
                q_user_id = result.user_id;
            },
            error: function () {
                alert("问题加载失败");
            }
        });

        $.ajax({
            url: "../php/get-answer.php",
            data: { "q_id": q_id },
            type: "post",
            datatype: "json",
            success: function (result) {
                for (var i = 0; i < result.length; i++) {
                    var html = " ";
                    var imgpath = "../../web大作业/image/img_user/" + result[i].img_path;
                    var html = "<div class='answer-each'><div class='info'> <div class='a-headpic'> <img src=" + imgpath + "></div><div class='a-username'>" + result[i].username + "</div>";
                    html += "<div class='a-createtime'>" + result[i].createtime + "</div></div><div class='answer markdown-body'>" + result[i].content + "</div>";
                    html += "<div class='bottom'><div class='remark-btn'>评论</div><div class='like'>喜欢</div><div class='report'>举报</div></div></div>";
                    $('.answer-display-box').append(html);
                }
            },
            error: function () {
                alert("回答加载失败");
            }
        })

    } else {

        var username = sessionStorage.getItem('username');
        var q_title = sessionStorage.getItem('q_title');
        var q_content = sessionStorage.getItem('q_content');
        $('#username').html(username);
        $('#ques_title').text(q_title);
        $('#ques_content').html(q_content);
        console.log('answer页面从sessionstorage取到的q_content的内容为' + q_content);
    };
    $('.post-btn').click(function () {
        var text_input = $('#q_content').val();
        var converter = new showdown.Converter();
        converter.setOption('tables', true);
        var text_output = converter.makeHtml(text_input);
        var content = text_output;
        var user_id = sessionStorage.getItem('userid');
        if (user_id === q_user_id) {
            alert("不能回复自己的问题哦！");
        } else {
            $.ajax({
                url: "../php/submit-answer.php",
                data: { "user_id": user_id, "content": content, "q_id": q_id },
                datatype: "json",
                type: "post",
                success: function (result) {
                    alert('回复成功');
                    var html = " ";
                    var imgpath = "../../web大作业/image/img_user/" + result.img_path;
                    var html = "<div class='answer-each'><div class='info'> <div class='a-headpic'> <img src=" + imgpath + "></div><div class='a-username'>" + result.username + "</div>";
                    html += "<div class='a-createtime'>" + result.createtime + "</div></div><div class='answer markdown-body'>" + result.content + "</div>";
                    html += "<div class='bottom'><div class='remark-btn'>评论</div><div class='like'>喜欢</div><div class='report'>举报</div></div></div>";
                    $('.answer-display-box').append(html);
                },
                error: function () {
                    alert("您还未登录，不可评论");
                }
            });
        }
    });
})