<template>
  <div>
    <div class="toolbar-top"></div>
    <!-- <div class="navigator">
    </div> -->
    <div class="center">
      <div class="questionNav">
        <div class="section">
          <div class="section-title">排行榜</div>
          <div class="section-item">用户榜</div>
          <div class="section-item">领域榜</div>
        </div>
        <div class="section">
          <div class="section-title">领域</div>
          <div
            class="section-item"
            v-for="(item, index) in Object.keys(QuestionTags)"
            :key="index"
          >
            {{ item }}
          </div>
        </div>
      </div>
      <div class="question-display">
        <div class="guide-bar">
          <div class="guide-item" id="newest">最新</div>
          <div class="guide-item" id="hotest">最热</div>
          <div class="guide-item" id="answer-zero">待回答</div>
        </div>
        <div class="concret-q">
          <div
            class="item-each"
            v-for="(item, index) in QuestionList"
            :key="index"
            :data-id="item.q_id"
            @click="navToQuestion(item.q_id)"
          >
            <div class="q-item">
              <div class="q-item-l">
                <div class="q-item-l-box">
                  <li>回答</li>
                  <li>0</li>
                </div>
              </div>
              <div class="q-item-r">
                <div class="q-item-title">{{ item.title }}</div>
                <div class="q-item-bottom">
                  <div class="tag">
                    <div
                      class="tag-each"
                      v-for="(tag, index) in item.tagList.split(',')"
                      :key="index"
                    >
                      {{ tag }}
                    </div>
                  </div>
                  <div class="create-time">{{ item.createTime }}</div>
                  <div class="user">{{ item.nickname }}</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="my-info"></div>
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  name: "QAList",
  mounted() {
    console.log("QAlist 挂载了");
    // 通知vuex发请求，获取数据，存储于仓库之中
    this.$store.dispatch("reqQuestionTags");
    //发送get请求获取问题列表
    this.$store.dispatch("reqQList");
  },
  computed: {
    ...mapState({
      QTypeList: (state) => {
        return state.Question.QTypeList;
      },
      QuestionTags: (state) => {
        return state.Question.QuestionTags;
      },
      QuestionList: (state) => {
        return state.Question.QuestionList;
      },
    }),
  },
  methods: {
    navToQuestion(id) {
      // console.log("event in qalist is", event.target.dataset);
      // console.log(event.target.getAttribute("id"));
      this.$router.push({
        path: "Questions",
        query: {
          q_id: id,
        },
      });
    },
  },
};
</script >

<style lang="less" scoped>
.center {
  margin-top: 50px;
}
.questionNav {
  margin-left: 50px;
  display: flex;
  float: left;
  flex-direction: column;
  background-color: #fff;
  box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.05);
  .section-item,
  .section-title {
    height: 50px;
    width: 100px;
    line-height: 50px;
  }
  .section-title {
    font-weight: 700;
    color: #555;
    text-indent: 1em;
  }
  .section-item {
    cursor: pointer;
    text-align: center;
    color: #000;
  }
  .section-item:hover {
    background-color: #eee;
  }
  .section {
    display: flex;
    flex-direction: column;
  }
}
.navigator {
  float: left;
  width: 200px;
  margin-left: 50px;
  background-color: #fff;
  height: 800px;
}
.question-display {
  float: left;
  width: 900px;
  box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.05);
  margin-left: 70px;
  background-color: #fff;
}
.guide-bar {
  display: flex;
  border-bottom: 1px solid#ccccd8;
}
.guide-item {
  cursor: pointer;
  width: 60px;
  height: 40px;
  text-align: center;
  line-height: 40px;
}
.q-item {
  width: 100%;
  height: 105px;
  border-bottom: 1px solid#ccccd8;
  list-style: none;
}
.q-item-l {
  float: left;
  width: 20%;
  height: 100%;
}
.q-item-l-box {
  margin-top: 40px;
  width: 100%;
  text-align: center;
}
.q-item-r {
  float: right;
  width: 80%;
  height: 100%;
}
.q-item-title,
.q-item-content,
.q-item-bottom {
  margin-top: 8px;
}
.q-item-title {
  font-weight: bold;
}

.tag {
  float: left;
}
.user,
.create-time {
  float: right;
  margin-right: 10px;
}
.tag-each {
  background-color: #ebf2f7;
  color: #69aedf;
  margin: 7px;
  display: inline-block;
  cursor: pointer;
}
.item-each {
  cursor: pointer;
}
</style>