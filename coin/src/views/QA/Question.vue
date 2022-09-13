<template>
  <div>
    <div class="question-show-box">
      <div class="question-show-inner" v-loading="loading">
        <div class="user-info">
          <div class="user-info-each">
            <img :src="imgPath" id="head-pic" />
          </div>
          <div class="user-info-each" id="username">{{ nickname }}</div>
          <div class="user-info-each" id="createtime">{{ createtime }}</div>
          <div class="user-info-each" id="other"></div>
        </div>
        <div class="question-title">
          <h3 id="ques_title">{{ q_title }}</h3>
        </div>
        <div class="tag">
          <div class="tag-each" v-for="(tag, index) in tagList" :key="index">
            {{ tag }}
          </div>
        </div>
        <div class="question-content">
          <div id="ques_content" v-html="q_content" class="markdown-body"></div>
        </div>
        <div class="bar">
          <div class="bar-box" id="answer-btn">写回答</div>
          <div class="bar-box" id="like">好问题</div>
          <div class="bar-box" id="collect">收藏</div>
          <div class="bar-box" id="other-option">...</div>
        </div>
      </div>
    </div>
    <div class="answer-display-box">
      <Solution
        v-for="(answer, index) in answerList"
        :key="index"
        :answerEach="answer"
      />
    </div>
    <div class="edit-answer">
      <div class="edit-answer-inner">
        <EditBox @markdownTransf="getMarkdownHtml" />
      </div>
      <div class="post-btn" @click="addAnswer">提交</div>
    </div>
  </div>
</template>

<script>
import EditBox from "@/components/EditBox.vue";
import Solution from "./Solution.vue";
import showdown from "showdown";
var converter = new showdown.Converter();
export default {
  name: "Question",
  components: { EditBox, Solution },
  data() {
    return {
      q_title: "",
      q_content: "",
      nickname: "",
      createtime: "",
      imgPath: "",
      tagList: [],
      markdownHtml: "",
      answerList: [],
      loading: false,
    };
  },
  methods: {
    async addAnswer() {
      let user_id = this.$store.state.user.user.user_id;
      let q_id = this.$route.query.q_id;
      let content = this.markdownHtml;
      if (!user_id) {
        this.$message({
          message: "请先登录！",
          type: "error",
          duration: 2000,
        });
      } else if (!this.markdownHtml) {
        this.$message({
          message: "回答的内容为空！",
          type: "error",
          duration: 2000,
        });
      } else {
        try {
          let result = await this.$store.dispatch("addAnswer", {
            user_id,
            q_id,
            content,
          });
          console.log("提交回答后收到", result);
          // let answer = {};
          // answer["anwer_id"] = result.anwer_id;
          // answer["markdownHtml"] = this.markdownHtml;
          // answer["user"] = result.user;
          // this.answerList.push(answer);
          this.$message({
            message: "提交回答成功！",
            duration: 1500,
            type: "success",
          });
        } catch (e) {
          this.$message({
            message: e,
            type: "error",
            duration: 2000,
          });
        }
      }
    },
    getMarkdownHtml(data) {
      this.markdownHtml = data;
    },
    async reqQuestion(q_id) {
      if (q_id) {
        await this.$API
          .reqQuestionById(q_id)
          .then((res) => {
            // console.log("result in reqQuestionBYID is", res.data);
            let question = JSON.parse(res.data.question);
            console.log("question is", question);
            this.q_content = question.q_content;
            this.nickname = question.nickname;
            this.imgPath = question.img_path;
            this.createtime = question.createTime;
            this.q_title = question.q_title;
            this.tagList = question.tagList.split(",");
          })
          .catch((error) => {
            this.$message({
              message: error,
              type: "error",
              duration: 2000,
            });
          });
        await this.$API
          .reqAnswerById(q_id)
          .then((res) => {
            this.answerList = JSON.parse(res.data.answer);
          })
          .catch((error) => {
            this.$message({
              message: error,
              type: "error",
              duration: 2000,
            });
          });
      }
    },
  },
  created() {
    let q_id = this.$route.query.q_id;
    this.loading = true;
    this.reqQuestion(q_id);
    this.loading = false;
  },
};
</script>

<style scoped>
@import "@/assets/css/github-markdown.css";
* {
  text-decoration: none;
  list-style: none;
  margin: 0;
  padding: 0;
}
body {
  background-color: #f5f7f8;
  font-size: 16px;
}
.question-show-box,
.edit-answer {
  margin-left: 40px;
  background-color: #fff;
  width: 55%;
  margin-top: 20px;
}
.answer-display-box {
  margin-left: 40px;
  width: 55%;
  margin-top: 20px;
}
.edit-answer-inner {
  margin-top: 10px;
  padding: 15px;
  height: 400px;
}
.question-show-inner {
  padding: 20px;
}
.user-info {
  height: 50px;
}
.user-info-each:first-child {
  margin-left: 0;
}
.user-info-each {
  display: inline-block;
  margin-left: 10px;
}
.question-title {
  margin-bottom: 10px;
}
.question-content {
  margin-bottom: 30px;
}
.bar {
  display: flex;
  justify-content: space-evenly;
}
.bar-box {
  height: 30px;
  line-height: 30px;
  color: #999aaa;
}
#answer-btn {
  width: 100px;
  border-radius: 5px;
  text-align: center;
  background-color: rgb(78, 144, 243);
  color: #fff;
  cursor: pointer;
}
#like {
  width: 120px;
  border-radius: 4px;
  text-align: center;
  background: url("@/assets/icons/点赞.png") no-repeat left center;
  border: 1px solid #e8e8ed;
}
#collect {
  width: 120px;
  border-radius: 4px;
  text-align: center;
  background: url("@/assets/icons/收藏.png") no-repeat left center;
  border: 1px solid #e8e8ed;
}
.post-btn {
  margin-left: 400px;
  width: 80px;
  height: 35px;
  border-radius: 35px;
  line-height: 35px;
  color: #fff;
  text-align: center;
  margin-top: 10px;
  background-color: rgb(78, 146, 243);
}
.tag {
  margin: 10px auto;
  height: 30px;
}
#head-pic {
  width: 48px;
  height: 48px;
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

@media (max-width: 767px) {
  .markdown-body {
    padding: 10px;
  }
}
.tag-each {
  background-color: #ebf2f7;
  color: #69aedf;
  margin: 7px;
  display: inline-block;
  cursor: pointer;
}
.tag:nth-child(1) {
  margin-left: 0;
}

#q_content_show {
  overflow-y: scroll;
  width: 100%;
  height: 90%;
  max-height: 300px;
}
</style>