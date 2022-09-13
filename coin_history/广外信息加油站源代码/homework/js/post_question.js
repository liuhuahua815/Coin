$(function () {
    $('.toolbar-top').load('toolbar.html');
    $('.editor-area').load('editor-box.html');
    $('.tag-display-box').hide();

    //  动态加载后台的标签
    $('.tag-add-btn').click(function () {
        $('.tag-display-box').show();
    });
    $('.tag-box-close').click(function () {
        $('.tag-display-box').hide();
    });
    $('.q-submit-button').click(function () {

        var userid = sessionStorage.getItem("userid");
        // 获取问题的信息
        var text_input = $('#q_content').val();
        var converter = new showdown.Converter();
        converter.setOption('tables', true);
        var text_output = converter.makeHtml(text_input);
        var question_content = text_output;
        var question_title = $('#title-input').val();
        // 获取用户添加的标签，将标签的id存入数组tags  标签名存入数组tags_name
        var tags = new Array();
        $('.tag-add-each').each(function () {
            tags.push($(this).attr('data-id'));
        });
        var tags_name = new Array();
        $('.tag-add-each').each(function () {
            tags_name.push($(this).text());
        });

        if (userid === null) {
            alert("用户未登录不能发布问题！");
        } else if (question_title === "") {
            alert("用户未输入问题的标题！");
        } else if (text_input === "") {
            alert("用户未输入问题的内容！");
        } else if (tags.length === 0) {
            alert("必须为问题添加至少一个便签");
        }
        else if (tags.length > 3) {
            alert("添加的标签不能超过3个");
        }
        else {
            var all_data = { "q_title": question_title, "q_content": question_content, "tag_group": tags, "user_id": userid };
            $.ajax({
                type: "POST",
                url: "../php/submit-question.php",
                // data: { "q_title": question_title, "q_content": question_content, "tag_group": tags, "user_id": userid },
                data: JSON.stringify(all_data),
                success: function (message) {
                    alert("问题存储成功");
                    // 将当前发布问题的标签名、标题、内容添加到会话中。目的：发布问题后跳转answer.html，可以从sessionStorage中取数据，加载问题
                    sessionStorage.setItem("tags_name", tags_name);
                    sessionStorage.setItem("q_title", question_title);
                    sessionStorage.setItem("q_content", question_content);
                    window.location.href = "answer.html";
                },
                error: function (data) {
                    alert("问题存储失败");
                }
            });
        }
    });
    $('.tag-type-items').click(function () {
        console.log($(this).text())
        $.ajax({
            type: "POST",
            url: "../php/get-tag.php",
            data: { "tag_type": $(this).text() },
            dataType: 'json',
            success: function (data) {
                $('.tag-content-show').empty();
                for (var i = 0; i < data.length; i++) {
                    console.log(data[i].tag_name);
                    var html = "<div class='tag-each'" + "data-id=" + data[i].tag_id + ">" + data[i].tag_name + "</div>";
                    $('.tag-content-show').append(html);

                }
            },
            error: function (data) {
                alert("问题加载失败" + data);
            }
        });
    });
    $(".tag-content-show").on('click', '.tag-each', function () {
        $('.tag-tip').hide();
        console.log($(this).text());
        $(this).css("background-color", "#507999");
        $(this).css("color", "#fff");
        var html = "<div class='tag-add-each' " + "data-id=" + $(this).attr("data-id") + ">" + $(this).text() + "<img class='tag-add-close' src='../icon/关闭-6c79a8.png' ></div>";
        $('.tag-box').prepend(html);
    });
    $(document).on('click', '.tag-add-close', function () {
        console.log('tag-add-calose');
        $(this).parent().remove();
    });
    // $(".haha").click(function () {
    //     var tags_name = new Array();
    //     $('.tag-add-each').each(function () {
    //         tags_name.push($(this).text());
    //     })
    //     sessionStorage.setItem("tags_name", tags_name);
    //     var names = sessionStorage.getItem("tags_name");
    //     console.log('click');
    //     arr = names.split(',');
    //     for (var i = 0; i < arr.length; i++) {
    //         console.log(arr[i]);
    //     }
    // })

});