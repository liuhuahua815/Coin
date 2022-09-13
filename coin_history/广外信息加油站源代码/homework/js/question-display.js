$(function () {
    question_arr = Array();
    $('.toolbar-top').load('toolbar.html');
    $.ajax({
        type: "GET",
        url: "../php/question-display.php",
        dataType: 'json',
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                tags_name = data[i].tags_name;

                console.log(typeof (tags_name));
                console.log("tags_name: " + tags_name);

                var taghtml = " ";
                html = " ";
                for (var j = 0; j < tags_name.length; j++) {
                    taghtml += "<div class='tag-each'> " + tags_name[j] + "</div>";
                }
                html = "<div class='item-each' question-id=" + data[i].q_id + "><div class='q-item'><div class='q-item-l'> <div class='q-item-l-box'><li>回答</li><li>" + data[i].count + "</li></div></div>";
                html += "<div class='q-item-r'><div class='q-item-title'>" + data[i].q_title + "</div>";
                html += "<div class='q-item-bottom'><div class='tag'>" + taghtml + "</div><div class='create-time'>" + data[i].crateTime + "</div><div class='user'>" + data[i].user_name + "</div>";
                html += "</div></div></div></div>";
                $('.concret-q').append(html);
                arr_each = { "count": data[i].count, "html": html };
                question_arr.push(arr_each);
                // console.log("加载成功");
            }
            console.log(question_arr);
            console.log(typeof (question_arr[0]["cratetime"]));
        },
        error: function (data) {
            alert("问题加载失败" + data);
        }
    });
    $('.concret-q').on('click', '.item-each', function () {
        console.log('item-each click');
        window.location.href = "answer.html?q_id=" + $(this).attr("question-id");
    });
    $('#newest').click(function () {
        $('#hotest').css("border-bottom", "");
        $('#answer-zero').css("border-bottom", "");
        $(this).css("border-bottom", "1px solid black");
        $('.concret-q').empty();
        $.ajax({
            type: "GET",
            url: "../php/question-display-decs.php",
            dataType: 'json',
            success: function (data) {
                $(this).css("border-bottom", "1px solid black");
                $('.concret-q').empty();
                $.ajax({
                    type: "GET",
                    url: "../php/question-display-decs.php",
                    dataType: 'json',
                    success: function (data) {
                        for (var i = 0; i < data.length; i++) {
                            tags_name = data[i].tags_name;

                            console.log(typeof (tags_name));
                            console.log("tags_name: " + tags_name);

                            var taghtml = " ";
                            html = " ";
                            for (var j = 0; j < tags_name.length; j++) {
                                taghtml += "<div class='tag-each'> " + tags_name[j] + "</div>";
                            }
                            html = "<div class='item-each' question-id=" + data[i].q_id + "><div class='q-item'><div class='q-item-l'> <div class='q-item-l-box'><li>回答</li><li>0</li></div></div>";
                            html += "<div class='q-item-r'><div class='q-item-title'>" + data[i].q_title + "</div>";
                            html += "<div class='q-item-bottom'><div class='tag'>" + taghtml + "</div><div class='create-time'>" + data[i].crateTime + "</div><div class='user'>" + data[i].user_name + "</div>";
                            html += "</div></div></div></div>";
                            $('.concret-q').append(html);
                            arr_each = { "createtime": data[i].crateTime, "html": html };
                            question_arr.push(arr_each);
                            // console.log("加载成功");
                        }
                    },
                    error: function (data) {
                        alert("问题加载失败" + data);
                    }
                });
            }
        });
    });
    $('#hotest').click(function () {
        $('#newest').css("border-bottom", "");
        $('#answer-zero').css("border-bottom", "");
        $(this).css("border-bottom", "1px solid black");
        $('.concret-q').empty();
        question_arr1 = question_arr.sort(function (a, b) {
            return b.count - a.count;
        });
        for (var i = 0; i < question_arr1.length; i++) {
            $('.concret-q').append(question_arr1[i].html);
        }
    });
    $('#answer-zero').click(function () {
        $('#hotest').css("border-bottom", "");
        $('#newest').css("border-bottom", "");
        $(this).css("border-bottom", "1px solid black");
        $('.concret-q').empty();
        for (var i = 0; i < question_arr.length; i++) {
            if (question_arr[i].count === 0) {
                $('.concret-q').append(question_arr[i].html);
            }
        }
    });
});