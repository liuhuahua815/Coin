$(function () {
    $('.toolbar-top').load('toolbar.html');
    $('.reg-form-box').hide();
    $('#reg').click(function () {
        $('.reg-form-box').show();
        $('.login-reg-box').hide();
    });
    $('#login-btn').click(function () {
        console.log("click");
        $.ajax({
            type: "POST",
            url: "../php/login.php",
            data: $('.login-form-list').serialize(),
            dataType: "json",
            success: function (result) {
                if (result.message === "用户存在") {
                    alert("登录成功");
                    sessionStorage.setItem("username", result.username);
                    sessionStorage.setItem("imgpath", result.imgpath);
                    sessionStorage.setItem("userid", result.userid);
                    window.location.href = "index.html";
                } else {
                    alert(result.message);
                }


            },
            error: function (result) {
                alert("失败！");
                //                alert("nickname" + result.nickname);
                alert(result.message);
            }
        });
    });
    $('#reg-btn').click(function () {
        console.log("click");
        $.ajax({
            type: "POST",
            url: "../php/register.php",
            data: $('.reg-form-list').serialize(),
            dataType: "json",
            success: function (result) {
                alert(result.message);
                $('.reg-form-box').hide();
                $('.login-reg-box').show();
            },
            error: function () {

            }
        });
    });
    $('#submit-btn').click(function () {
        sessionStorage.setItem('username', $('#username').val())
    });
    $('#reg-btn').click(function () {
        sessionStorage.setItem('username', $('#nickname').val())
    });
    $('#password').focus(function () {
        if ($('#password').val() == "") {
            $('.inform-text').text("请输入6~16位密码");
            $('.inform').css("background-image", "url('../icon/提示.png')");
        }
    });
    $('#password').keyup(function () {
        if (($('#password').val().length != 0) && (($('#password').val().length < 6) || ($('#password').val().length > 16))) {
            $('.inform-text').text("您输入的位数不对,要求6~16位");
            $('.inform').css("background-image", "url('../icon/提示(1).png')");
            $("#check-password").attr("disabled", "disabled");
            $("#reg-btn").attr("disabled", "disabled");
        } else if ($('#password').val().length == 0) {
            $('.inform-text').text("请输入6~16位密码");
            $('.inform').css("background-image", "url('../icon/提示.png')");
        } else {
            $('.inform-text').text(" ");
            $("#check-password").attr("disabled", false);
            $('.inform').css("background-image", "url('../icon/提示 - 正确.png')");
        }

    });
    $('#check-password').keyup(function () {
        if (($('#password').val() != $('#check-password').val()) && ($('#password').val().length != 0)) {
            $('.inform-sec-text').text("两次输入密码不一致");
            $('.inform-sec').css("background-image", "url('../icon/提示(1).png')");
            $("#reg-btn").attr("disabled", "disabled");
        }
        else {
            $('.inform-sec-text').text(" ");
            $('.inform-sec').css("background-image", "url('../icon/提示 - 正确.png')");
            $("#reg-btn").attr("disabled", false);
        }
    });
})