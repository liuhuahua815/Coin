$(function () {

    $('.login-reg-btn').click(function () {
        console.log("btn clcik");
        window.location.href = "login-reg.html";
    });
    $('.login-reg-menu').hide();
    $('.news-menue').hide();
    $('.create-menue').hide();

    $('#login-reg').mouseover(function () {
        $('.login-reg-menu').show();

    });
    $('#login-reg').mouseout(function () {
        $('.login-reg-menu').hide();

    });
    $('#notice').mouseover(function () {
        $('.news-menue').show();
    });
    $('#notice').mouseout(function () {
        $('.news-menue').hide();
    });
    $('#create').mouseover(function () {
        $('.create-menue').show();
    });
    $('#create').mouseout(function () {
        $('.create-menue').hide();
    });
    $('#log-out').click(function () {
        alert("退出");
        sessionStorage.removeItem("userid");
        sessionStorage.removeItem("imgpath");
        // sessionStorage.setItem("userid", null);
        // sessionStorage.setItem("imgpath", null);
        window.location.reload();
    })
});
