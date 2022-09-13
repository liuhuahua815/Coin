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

    var note_id = getParam("note_id");
    var user_id = sessionStorage.getItem("userid");
    var note_user_id;
    $.ajax({
        url: "../php/get-note.php",
        data: { "note_id": note_id, "user_id": user_id },
        type: "POST",
        datatype: "json",
        success: function (result) {
            console.log(result.user_name);
            var imgpath = "../../web大作业/image/img_user/" + result.img_path;
            $('#head-pic').attr('src', imgpath);
            $('.user-name').html(result.user_name);
            $('.note-title').text(result.note_title);
            $('.createtime').text(result.createtime);
            // content的内容一定要通过HTML赋值，如果通过text，则不能用被渲染 
            $('.note-box').html(result.note_content);
            $('.like-num').text(result.like_num);
            $('.collect-num').text(result.collect_num);
            if (result.like_set == "true") {
                $('.like-pic').attr("src", "../icon/点赞-块(1).png");
            }
            if (result.collect_set == "true") {
                $('.collect-pic').attr("src", "../icon/收藏-块(1).png");
            }
            note_user_id = result.note_user_id;
        },
        error: function () {
            alert("问题加载失败");
        }
    });
    $('.user-behavior img').click(function () {

        if (user_id === null) {
            alert("您还未登录，不能点赞或者收藏哦！");
        } else if (user_id === note_user_id) {
            alert("不能给点赞或者收藏自己定文章哦！");
        }
        else {
            var origin_src = $(this).attr('src');
            var new_src;
            if (origin_src === "../icon/点赞-块.png") {
                new_src = "../icon/点赞-块(1).png";
                $(this).attr('src', "../icon/点赞-块(1).png");
                $.ajax({
                    url: "../php/note-like.php",
                    type: "post",
                    data: { "user_id": user_id, "note_id": note_id },
                    success: function (data) {
                        var data = JSON.parse(data);
                        sessionStorage.setItem("like_id", data["like_id"]);

                    },
                    error: function () {
                        alert("点赞失败");
                        console.log("失败");
                    }
                });
            }
            if (origin_src === "../icon/点赞-块(1).png") {
                new_src = "../icon/点赞-块.png";
                $(this).attr('src', new_src);
                $.ajax({
                    url: "../php/note-like-withdraw.php",
                    type: "post",
                    data: { "user_id": user_id, "note_id": note_id },
                    success: function (data) {
                        var data = JSON.parse(data);
                        sessionStorage.setItem("like_id", data["like_id"]);

                    },
                    error: function () {
                        alert("取消点赞失败");
                        console.log("失败");
                    }
                });
            }
            if (origin_src === "../icon/收藏-块.png") {
                new_src = "../icon/收藏-块(1).png";
                $(this).attr('src', new_src);
                $.ajax({
                    url: "../php/note-collect.php",
                    type: "post",
                    data: { "user_id": user_id, "note_id": note_id },
                    success: function (data) {
                        var data = JSON.parse(data);
                        sessionStorage.setItem("collect_id", data["collect_id"]);
                    },
                    error: function () {
                        alert("收藏失败");
                        console.log("失败");
                    }
                });
            }
            if (origin_src === "../icon/收藏-块(1).png") {
                new_src = "../icon/收藏-块.png";
                $(this).attr('src', new_src);
                $.ajax({
                    url: "../php/note-collect-withdraw.php",
                    type: "post",
                    data: { "user_id": user_id, "note_id": note_id },
                    success: function (data) {
                        var data = JSON.parse(data);
                        sessionStorage.setItem("collect_id", data["collect_id"]);
                    },
                    error: function () {
                        alert("取消收藏失败");
                        console.log("失败");
                    }
                });
            }
        }
    });

})