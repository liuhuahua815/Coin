<template>
  <div>
    <div class="pageRoot">
      <div class="left">
        <div class="basicInfo">
          <div class="layer1">
            <div
              class="headPic"
              @mouseenter="isCoverShow = true"
              @mouseleave="isCoverShow = false"
            >
              <img id="headPicImg" :src="imgPath" alt="" />
              <div class="imgCover" v-show="isCoverShow" @click="toGetImg">
                <MyIcon class="coverIcon" type="photo" />
              </div>
            </div>

            <div class="otherInfo">
              <div class="nickname">{{ user.nickname }}</div>
            </div>
          </div>
          <div class="layer2">
            <div class="coin">
              <MyIcon class="coinIcon" type="coin" /><span
                >余额 {{ user.user_coin }}</span
              >
            </div>
          </div>
        </div>
        <div class="moreInfo">
          <div id="moreInfo-title">基本信息</div>
          <el-form id="moreInfo-content" label-width="80px">
            <FormInput
              labelEng="nickname"
              label="昵称"
              :originInfo="user.nickname || '未知'"
            />
            <FormInput
              label="学校"
              labelEng="school"
              :originInfo="user.school || '未知'"
            />
            <form-select
              label="性别"
              labelEng="sex"
              :originInfo="user.sex || '未知'"
              placeholder="请选择性别"
              :option="options.sex"
            />
            <FormInput
              label="年龄"
              labelEng="age"
              :originInfo="user.age || '未知'"
            />
            <form-select
              label="专业"
              labelEng="major"
              :originInfo="user.major || '未知'"
              placeholder="请选择专业"
              :option="options.major"
            />
            <form-select
              label="年级"
              labelEng="grade"
              :originInfo="user.grade || '未知'"
              placeholder="请选择年级"
              :option="options.grade"
            />
          </el-form>
        </div>
      </div>
      <div class="right">
        <el-tabs type="border-card">
          <el-tab-pane label="博客管理">博客管理</el-tab-pane>
          <el-tab-pane label="课程问答">课程问答</el-tab-pane>
          <el-tab-pane>
            <span slot="label"
              ><i class="el-icon-collection-tag"></i> 我的收藏</span
            >
            我的行程
          </el-tab-pane>
          <el-tab-pane label="关注/订阅">关注/订阅</el-tab-pane>
        </el-tabs>
      </div>
    </div>
  </div>
</template>

<script>
// import MyIcon from "@/components/MyIcon.vue";
import FormInput from "@/components/FormInput";
import FormSelect from "@/components/FormSelect.vue";
let inputElement = null;
export default {
  name: "UserCenter",
  components: { FormInput, FormSelect },
  data() {
    return {
      user: {},
      isCoverShow: false,
      options: {
        sex: ["男", "女"],
        major: [
          "软件工程",
          "计算机科学与技术",
          "网络安全",
          "大数据",
          "人工智能",
        ],
        grade: ["大一", "大二", "大三", "大四"],
      },
      imgPath: "",
    };
  },
  mounted() {
    console.log("!!!", this.$store.state.user.user);
    this.user = this.$store.state.user.user;
    this.imgPath = this.user.img_path;
    console.log("userCenter mounted", this.imgPath);
  },
  methods: {
    test() {
      console.log("mouseover ");
      this.currentEdit = "nickname";
    },
    changeUserInfo(key) {
      this.form[key].show = false;
    },
    inputShow(key) {
      console.log("input show click", key);
      this.form[key].show = true;
    },
    onSubmit() {
      console.log("submit!");
    },
    showImgCover() {},
    toGetImg() {
      if (inputElement === null) {
        // 生成文件上传的控件
        inputElement = document.createElement("input");
        inputElement.setAttribute("type", "file");
        inputElement.style.display = "none";

        if (window.addEventListener) {
          inputElement.addEventListener("change", this.uploadFile, false);
        } else {
          inputElement.attachEvent("onchange", this.uploadFile);
        }

        document.body.appendChild(inputElement);
      }
      inputElement.click();
    },
    async uploadFile(el) {
      if (el && el.target && el.target.files && el.target.files.length > 0) {
        console.log(el);
        const file = el.target.files[0];
        console.log("文件为：", file);
        const isLt2M = file.size / 1024 / 1024 < 2;
        const size = file.size / 1024 / 1024;
        // console.log("size:", size);
        // 判断上传文件的大小
        if (!isLt2M) {
          this.$message.error("上传头像图片大小不能超过 2MB!");
        } else if (file.type.indexOf("image") === -1) {
          //如果不是图片格式
          // this.$dialog.toast({ mes: '请选择图片文件' });
          this.$message.error("请选择图片文件");
        } else {
          let myFormData = new FormData();
          myFormData.append("file", file);
          console.log("formdata is", myFormData);
          try {
            var url = await this.$store.dispatch("updateAvatar", myFormData);
            this.imgPath = url;
            console.log("头像为", this.imgPath);
            this.$message({
              message: "头像更换成功",
              duration: 2000,
              type: "success",
            });
          } catch (e) {
            this.$message({
              message: e,
              duration: 2000,
              type: "error",
            });
          }
          // console.log("上传的结果为", result.data);
          // var url = URL.createObjectURL(file);
        }
      }
    },
  },
};
</script>

<style lang="less" scoped>
.coinIcon {
  font-size: 30px;
}
.pageRoot {
  margin-top: 30px;
  display: flex;
  justify-content: center;
}
.left {
  float: left;
  .basicInfo {
    box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.12), 0 0 6px 0 rgba(0, 0, 0, 0.04);
    background-color: #fff;
    padding: 10px;
    .layer1 {
      border-bottom: 1px solid #c3c3c3;
      display: flex;
      margin-bottom: 10px;
      .headPic {
        position: relative;
        width: 64px;
        height: 64px;
        margin-bottom: 10px;
        #headPicImg {
          width: 64px;
          height: 64px;
          display: block;
          border-radius: 50%;
        }
        .imgCover {
          width: 64px;
          height: 64px;
          display: flex;
          justify-content: center;
          align-items: center;
          position: absolute;
          top: 0;
          left: 0;
          background: rgba(0, 0, 0, 0.5);
          border-radius: 50%;
          .coverIcon {
            width: 70%;
            height: 70%;
            color: #eee;
          }
        }
      }
    }
  }
  .moreInfo {
    box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.12), 0 0 6px 0 rgba(0, 0, 0, 0.04);
    width: 450px;
    background-color: #fff;
    height: 480px;
    margin-top: 30px;
  }
  #moreInfo-title {
    height: 40px;
    font-weight: 700;
    line-height: 40px;
    background-color: #f5f7fa;
    text-indent: 2em;
    color: #555;
  }
  #moreInfo-content {
    padding: 30px 40px 30px 10px;
  }
}
.right {
  float: left;
  margin-left: 40px;
  width: 800px;
}
</style>