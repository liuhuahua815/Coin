<template>
  <div class="postQRoot">
    <div class="notice-box">
      <div class="alertNotice">
        <el-alert
          v-if="noticeShow"
          :title="noticeContent"
          type="warning"
          show-icon
          @close="closeElert"
        >
        </el-alert>
      </div>
      <div class="alertNotice">
        <el-button ref="postQNotice" type="text" @click="open"></el-button>
      </div>
    </div>
    <div class="editor-box">
      <div class="editor-box-inner">
        <h4>标题</h4>
        <div class="title-item">
          <input
            type="text"
            name="q_title"
            id="title-input"
            placeholder="请具体描述问题，杜绝出现“小白”、“大佬”等与问题无关的词汇"
            v-model="title"
          />
        </div>
        <h4>内容</h4>
        <div class="editor-area">
          <EditBox @markdownTransf="getMarkdownHtml" />
        </div>
      </div>
    </div>
    <div class="sidebar-box">
      <div class="siderbar-box-inner">
        <div class="tip-box">
          <div class="tip-box-content">AI小助手</div>
        </div>
        <div class="tag">
          <div class="tag-top">标签</div>
          <div class="tag-box">
            <div @click="isShow = true" class="tag-add-btn"></div>
            <div class="tag-tip" v-if="tagAddArr.length == 0">
              至少添加一个标签
            </div>
            <div
              class="tag-add-each"
              v-for="(value, index) in tagAddArr"
              :key="index"
            >
              {{ value }}
              <img
                class="tag-add-close"
                src="../../assets/icons/关闭-6c79a8.png"
                @click="tagAddArr.splice(index, 1)"
              />
            </div>
          </div>
        </div>
        <div class="q-submit-button" @click="navToQA">提交问题</div>
      </div>
      <!-- <div class="haha">点我试试</div> -->
    </div>
    <div v-show="isShow" class="tag-display-box">
      <div class="tag-display-inner">
        <div class="tag-box-top">
          标签
          <img
            @click="isShow = false"
            src="../../assets/icons/关闭.png"
            class="tag-box-close"
          />
        </div>
        <div class="tag-show-box">
          <div class="tag-type">
            <ul>
              <li
                class="tag-type-items"
                v-for="(value, name, index) in QuestionTags"
                :key="index"
                @click="showtags = name"
              >
                {{ name }}
              </li>
            </ul>
          </div>
          <div class="tag-content-show">
            <div
              class="tag-each"
              v-for="(value, index) in QuestionTags[showtags]"
              :key="index"
              @click="tagAddHandler(value)"
            >
              {{ value }}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import EditBox from "@/components/EditBox";
import { mapState } from "vuex";
export default {
  components: { EditBox },
  name: "PostQ",
  data() {
    return {
      isShow: false,
      showtags: "",
      tagAddArr: [],
      noticeContent: "",
      noticeShow: false,
      markdownHtml: "",
      title: "",
    };
  },
  mounted() {
    console.log("this is", this.$store.state.Question.QuestionTags);
    // 通知vuex发请求，获取数据，存储于仓库之中
    this.$store.dispatch("reqQuestionTags");
  },
  computed: {
    ...mapState({
      QuestionTags: (state) => {
        return state.Question.QuestionTags;
      },
    }),
  },
  methods: {
    closeElert() {
      this.noticeShow = false;
      this.noticeContent = "";
    },
    tagAddHandler(value) {
      console.log("点击了");
      this.noticeShow = false;
      if (this.tagAddArr.includes(value)) {
        this.noticeShow = true;
        this.noticeContent = "该标签已经添加过了";
      } else if (this.tagAddArr.length < 3) {
        this.noticeShow = false;
        this.tagAddArr.push(value);
      } else {
        this.noticeShow = true;
        this.noticeContent = "至多添加三个标签";
      }
    },
    open() {
      this.$MessageBox.alert("请先登录", "警告", {
        confirmButtonText: "确定",
      });
    },
    async navToQA() {
      if (localStorage.getItem("TOKEN") == null) {
        this.postQNoticeShow = true;
        console.log(this.$refs.postQNotice);
        this.$refs.postQNotice.$el.click();
      } else if (!this.title) {
        this.noticeShow = true;
        this.noticeContent = "标题不能为空";
      } else if (!this.markdownHtml) {
        this.noticeShow = true;
        this.noticeContent = "问题内容不能为空";
      } else if (!this.tagAddArr.length) {
        this.noticeShow = true;
        this.noticeContent = "标签不能为空";
      } else {
        try {
          console.log("user in state", this.$store.state.user.user);
          console.log(
            "quesitontag in state",
            this.$store.state.Question.QuestionTags
          );
          var { user_id, nickname, img_path } = this.$store.state.user.user;
          let result = await this.$store.dispatch("addQuestion", {
            q_title: this.title,
            q_content: this.markdownHtml,
            tagList: this.tagAddArr.join(","),
            user_id,
            nickname,
            img_path,
          });
          console.log("result in postQ is", result);
          this.$router.push({
            path: "Questions",
            query: {
              q_id: result,
            },
          });
        } catch (e) {
          alert(e);
        }
      }
      // this.$router.push({
      //   name: "QAndA",
      //   params: {
      //     id: 123456,
      //   },
      // });
    },
    getMarkdownHtml(data) {
      this.markdownHtml = data;
    },
  },
};
</script>

<style lang="less">
@coin-blue: #4e90f2;
body {
  background-color: #f5f7f8;
}
.postQRoot {
  width: 100%;
  height: 100vh;
  position: relative;
}
.alertNotice {
  position: absolute;
  left: 50%;
  top: 10%;
  transform: translate(-50%, 0);
  z-index: 99;
}
.el-alert {
  width: 400px;
  height: 50px;
}
.editor-box {
  margin: 20px;
  float: left;
}
.editor-box-inner {
  margin-left: 10px;
  background-color: #fff;
  width: 800px;
}
.title-item {
  margin: 10px auto;
  width: 750px;
  height: 30px;
}
#title-input {
  width: 100%;
  height: 100%;
  border-radius: 4px;
  border: 1px solid #ccccd8;
  background-color: #fff;
  color: #555666;
  display: inline-block;
  font-size: 16px;
}
.editor-area {
  margin-top: 15px;
  height: 680px;
  width: 800px;
}
.sidebar-box {
  margin: 20px auto;
  float: left;
}
.siderbar-box-inner {
  background-color: #fff;
  padding: 25px;
  font-size: 14px;
  width: 400px;
}
.tip-box {
  border-bottom: 1px solid #ccc;
  height: 100px;
}
.q-submit-button {
  text-align: center;
  display: inline-block;
  width: 200px;
  height: 36px;
  margin: 10px 100px;
  line-height: 36px;
  background-color: #4e90f2;
  color: #fff;
  border-radius: 18px;
  cursor: pointer;
}
.tag-box {
  display: flex;

  .tag-add-btn {
    width: 25px;
    height: 25px;
    cursor: pointer;
    margin-right: 3px;
    background: #ebf2f7 url(../../assets/icons/添加\(1\).png) no-repeat center;
  }
  .tag-add-each {
    line-height: 16px;
    height: 16px;
    color: #6c79a8;
    margin-right: 3px;
    background-color: #ebf2f7;
  }
}

.tag-tip {
  margin-left: 5px;
  line-height: 25px;
  color: #69aedf;
}
.tag-display-box {
  position: absolute;
  width: 400px;
  height: 300px;
  z-index: 99999;
  background-color: #fff;
  border-radius: 5px;
  border: 1px solid #ccc;
  left: 400px;
  top: 200px;
}
.tag-display-inner {
  padding: 10px 15px;
  width: 100%;
  height: 100%;
  box-sizing: border-box;
}
.tag-box-top {
  text-align: center;
  height: 40px;
  line-height: 40px;
}
.tag-type {
  float: left;
  overflow-y: scroll;
  height: 240px;
  border-right: 1px solid #ccc;
}
.tag-box-close {
  position: relative;
  left: 160px;
}
.tag-type-items {
  width: 80px;
  text-align: center;
  line-height: 50px;
  cursor: pointer;
}
.tag-type-items:hover {
  background-color: #e8e8ed;
}
.tag-content-show {
  float: left;
  width: 67%;
}
.tag-each {
  background-color: #ebf2f7;
  color: #69aedf;
  margin: 7px;
  float: left;
  cursor: pointer;
}

.tag-box {
  display: flex;
}
</style>