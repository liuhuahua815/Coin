(function ($) {
    $.fn.extend({
        "insert": function (value) {
            //默认参数
            value = $.extend({
                "text": "123"
            }, value);

            var dthis = $(this)[0]; //将jQuery对象转换为DOM元素

            if (dthis.selectionStart || dthis.selectionStart == '0') {

                var start = dthis.selectionStart;
                var end = dthis.selectionEnd;
                var top = dthis.scrollTop;

                //以下这句，应该是在焦点之前，和焦点之后的位置，中间插入我们传入的值
                dthis.value = dthis.value.substring(0, start) + value.text + dthis.value.substring(end, dthis.value.length);
            }

            //在输入元素textara没有定位光标的情况
            else {
                this.value += value.text;
                this.focus();
            };

            return $(this);
        }
    })
})(jQuery);
$(function () {
    var converter = new showdown.Converter();
    converter.setOption('tables', true);
    $('#q_content').keydown(function (e) {

        console.log(e.key);
        if (e.key === 'Enter') {
            var rawData = $("#q_content").val();
            $("#textareaText").val(rawData + "\n");
            //		alert('按下了enter键');
        }
    });
    $('#q_content').keyup(function () {
        var text_input = $('#q_content').val();
        var text_output = converter.makeHtml(text_input);
        $('#q_content_show').html(text_output);
        console.log("text_input" + text_input);
        console.log(text_output);
    })
    $('.toolbar>span>img').mouseover(function () {
        console.log($(this).attr('src'));
        var origin_src = $(this).attr('src');
        var new_src;
        new_src = origin_src.replace(".png", "(1).png");
        console.log("new_src: " + new_src);
        $(this).attr('src', new_src);
    });
    $('.toolbar>span>img').mouseout(function () {
        console.log($(this).attr('src'));
        var origin_src = $(this).attr('src');
        var new_src;
        new_src = origin_src.replace("(1).png", ".png");
        console.log("new_src: " + new_src);
        $(this).attr('src', new_src);
    });
    //	$('.toolbar-right>span>img').click(function(){
    //	  var origin_src = $(this).attr('src');
    //	  if(origin_src.indexOf('加粗')){
    //		  $('q_content').var()
    //	  }
    //	});
    $('#bold').click(function () {
        console.log("click");
        $("#q_content").insert({ "text": "<b></b>" });
    });
    $('#em').click(function () {
        $("#q_content").insert({ "text": "<em></em>" });
    });
    $('#code').click(function () {
        $("#q_content").insert({ "text": "```\n\n\n```" });
    });
    $('#links').click(function () {
        $("#q_content").insert({ "text": "[]()" });
    });
    $('#table').click(function () {
        $("#q_content").insert({ "text": "\n| 表头 | 表头 |\n| ------ | ------ |\n| 单元格 | 单元格 |\n| 单元格 | 单元格 |\n" });
    });
    $('#h1').click(function () {
        $("#q_content").insert({ "text": "#" });
    });
    $('#h2').click(function () {
        $("#q_content").insert({ "text": "##" });
    });
    $('#h3').click(function () {
        $("#q_content").insert({ "text": "###" });
    });
    $('#quote').click(function () {
        $("#q_content").insert({ "text": ">" });
    });
    $('#list1').click(function () {
        $("#q_content").insert({ "text": "##" });
    });
    $('#list2').click(function () {
        $("#q_content").insert({ "text": "##" });
    });
    //    发布笔记
    $('.post-btn').click(function () {
        var user_id = sessionStorage.getItem("userid");
        // 获取笔记的信息
        var text_input = $('#q_content').val();
        var converter = new showdown.Converter();
        converter.setOption('tables', true);
        var text_output = converter.makeHtml(text_input);
        var note_content = text_output;
        var note_title = $('#title-input').val();
        var note_intro = $('#intro-input').val();
        console.log("note_content" + note_content);
        var json = JSON.stringify({ "note_title": note_title, "note_content": note_content, "note_intro": note_intro, "user_id": user_id });
        console.log(json);
        if (user_id === null) {
            alert("用户未登录不能发布问题！");
        } else if (note_title === "") {
            alert("用户未输入笔记名！");
        } else if (note_intro === "") {
            alert("用户未输入笔记简介！");
        }
        else if (text_input === "") {
            alert("用户未输入笔记的内容！");
        }
        else {
            $.ajax({
                type: "POST",
                url: "../php/post-note.php",
                // data: { "q_title": question_title, "q_content": question_content, "tag_group": tags, "user_id": userid },
                data: json,
                datatype: "json",
                success: function (result) {
                    alert("笔记存储成功");
                    window.location.href = "note.html?note_id=" + result.note_id;
                },
                error: function (data) {
                    alert("笔记存储失败");
                }
            });
        }
    });

});
