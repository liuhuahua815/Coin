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
	$('.content-output').hide();
	$('#edit-btn').css("border-bottom", "1px solid black");
	$('#edit-btn').click(function () {
		$('#edit-btn').css("border-bottom", "1px solid black");
		$("#preview-btn").css("border-bottom", "");;
		console.log("edit-btn");
		$('.content-input').show();
		$('.content-output').hide();
	});
	$('#preview-btn').click(function () {
		$('#preview-btn').css("border-bottom", "1px solid black");
		$("#edit-btn").css("border-bottom", "");
		console.log("preview-btn");
		var text_input = $('#q_content').val();
		var converter = new showdown.Converter();
		converter.setOption('tables', true);
		var text_output = converter.makeHtml(text_input);
		$('#q_content_show').html(text_output);
		console.log("text_input" + text_input);
		console.log(text_output);
		$('.content-input').hide();
		$('.content-output').show();

	});
	$('#q_content').keydown(function (e) {
		console.log(e.key);
		if (e.key === 'Enter') {
			var rawData = $("#q_content").val();
			$("#textareaText").val(rawData + "\n");
			//		alert('按下了enter键');
		}
	});
	$('.toolbar-right>span>img').mouseover(function () {
		console.log($(this).attr('src'));
		var origin_src = $(this).attr('src');
		var new_src;
		new_src = origin_src.replace(".png", "(1).png");
		console.log("new_src: " + new_src);
		$(this).attr('src', new_src);
	});
	$('.toolbar-right>span>img').mouseout(function () {
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
});
