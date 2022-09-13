<template>
  <div>
    <div class="answer-each">
      <div class="info">
        <div class="a-headpic"><img :src="answerEach.img_path" /></div>
        <div class="a-username">{{ answerEach.nickname }}</div>
        <div class="a-createtime"></div>
      </div>
      <div class="answer">
        <div class="markdown-body" v-html="answerEach.content"></div>
      </div>
      <div class="bottom">
        <div class="remark-btn">评论</div>
        <div class="like">喜欢</div>
        <div class="report">举报</div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Solution",
  props: ["answerEach"],
};
</script>

<style>
.answer-each {
  margin-top: 10px;
  background-color: #fff;
  padding: 10px;
  display: flex;
  flex-direction: column;
  margin-bottom: 20px;
}
.answer {
  max-height: 400px;
  overflow-y: scroll;
}
.bottom {
  display: flex;
}
.like,
.report,
.remark-btn {
  margin-left: 15px;
}
.info {
  height: 40px;
}
.a-headpic,
.a-username,
.a-createtime {
  float: left;
  margin-left: 30px;
}
.a-headpic > img {
  width: 40px;
  height: 40px;
  border-radius: 50%;
}

/*Github主题要求的样式引入*/
.markdown-body {
  box-sizing: border-box;
  min-width: 200px;
  max-width: 980px;
  margin: 0 auto;
  padding: 10px;
}
</style>