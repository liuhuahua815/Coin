<template>
  <div class="toolbar">
    <div class="toolbar-content">
      <div class="toolbar-content-left">
        <div class="logo-box">
          <img id="back-index" src="@/assets/logo.jpg" @click="navToHome" />
        </div>
        <ul class="toolbar-Menu-l">
          <li><router-link to="/Resource">期末急救箱</router-link></li>
          <li><router-link to="/QAList">答疑区</router-link></li>
          <li><router-link to="/NotebookList">笔记学习</router-link></li>
        </ul>
      </div>
      <div class="toolbar-content-middle">
        <div class="toolbar-Menu-m">
          <input
            type="text"
            v-model="searchContent"
            name="search-content"
            id="search-box"
          />
          <div @click="search" class="search-btn">搜索</div>
        </div>
      </div>
      <div class="toolbar-content-right">
        <div class="toolbar-Menu-r">
          <div
            id="login-reg"
            @mouseover="isShow.info = !isShow.info"
            @mouseout="isShow.info = !isShow.info"
          >
            <div v-show="!isLogin" @click="regLogin" class="login-reg-btn">
              登录/注册
            </div>
            <div v-show="isLogin" class="userHeadPic">
              <img :src="headPic" alt="" />
            </div>
            <div v-show="isLogin && isShow.info" class="login-reg-menu">
              <router-link to="/UserCenter">个人中心</router-link>
              <a href="">我的笔记</a>
              <a href="">我的提问</a>
              <a href="admin.html">后台管理</a>
              <a><span @click="loginOut">退出</span></a>
            </div>
          </div>
          <div
            @mouseover="isShow.news = !isShow.news"
            @mouseout="isShow.news = !isShow.news"
            id="notice"
          >
            <a>消息</a>
            <div v-show="isShow.news" class="news-menue">
              <router-link to="">评论</router-link>
              <a href="">点赞</a>
              <a href="">通知</a>
            </div>
          </div>
          <div
            @mouseover="isShow.create = !isShow.create"
            @mouseout="isShow.create = !isShow.create"
            id="create"
          >
            <div class="create-btn">创作</div>
            <div v-show="isShow.create" class="create-menue">
              <router-link to="/PostNote">记笔记</router-link>
              <router-link to="PostQ">提问题</router-link>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Navigator",
  data() {
    return {
      headPic: "",
      isShow: {
        info: false,
        news: false,
        create: false,
      },
      searchContent: "",
      isLogin: false,
    };
  },
  watch: {
    headPic: {
      handler(newVal, oldVal) {
        console.log("检测到数据改变了", newVal, "old is", oldVal);
        let imgPath = this.$store.state.user.user.img_path;
        console.log("imgpath is", imgPath);
        if (oldVal === "" && imgPath) this.headPic = imgPath;
      },
    },
  },
  methods: {
    navToHome() {
      this.$router.push({
        path: "/Resource",
      });
    },
    search() {
      this.$router.push(
        {
          name: "search",
          params: { searchContent: this.searchContent || undefined },
          query: { name: "花花" },
        },
        () => {},
        (error) => {
          console.log(error);
        }
      );
    },
    regLogin() {
      this.$router.push("/regLogin");
    },
    loginOut() {
      this.$store.commit("SET_USER", {});
      this.$store.commit("SET_TOKEN", "");
      this.isLogin = false;
      this.$message({
        message: "成功退出登录！",
        type: "success",
        duration: 1000,
      });
    },
    updateUserHeadPic(imgPath) {
      this.isLogin = true;
      this.headPic = imgPath;
    },
  },
  mounted() {
    this.$bus.$on("updateUserHeadPic", this.updateUserHeadPic);
    let img_path = this.$store.state.user.user.img_path;
    console.log("nav 组件 调用了mounted,img_path is", img_path);
    if (this.$store.state.user.user.img_path) {
      this.isLogin = true;
      this.headPic = img_path;
    } else {
      this.isLogin = false;
      this.headPic = "";
    }
  },
};
</script>

<style lang="less" scoped>
@height: 48px;
* {
  list-style: none;
  text-decoration: none;
}
.toolbar {
  font-size: 17px;
  font-weight: 400;
  color: #222226;
  background: #fff;
  box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.05);
  a {
    color: #222226;
  }
}

.toolbar-content {
  width: 100%;
  min-width: 1100px;
  height: @height;
  display: flex;
  line-height: 48px;
  color: #222226;
}
.toolbar-content-left {
  display: flex;
  width: 440px;
  justify-content: space-evenly;
}
.toolbar-content-middle {
  flex: 1;
  .toolbar-Menu-m {
    width: 390px;
    margin: 0 auto;
  }
  #search-box {
    width: 300px;
    height: 30px;
    display: inline-block;
  }
  .search-btn {
    display: inline-block;
    width: 80px;
    height: 35px;
    border-radius: 35px;
    line-height: 35px;
    color: #fff;
    text-align: center;
    margin-top: 10px;
    background-color: rgb(78, 146, 243);
  }
}
.logo-box img {
  width: 40px;
  height: 45px;
}
.toolbar-Menu-l {
  li {
    display: inline-block;
    margin: 0 10px;
    padding: 0 5px;
    cursor: pointer;
  }
  li:hover {
    background-color: #e8e8ed;
  }
}
.toolbar-content-right {
  width: 350px;
  .toolbar-Menu-r {
    display: flex;
    justify-content: space-evenly;
  }
}

#login-reg,
#notice,
#create {
  position: relative;
  cursor: pointer;
}
#login-reg {
  .login-reg-btn {
    cursor: pointer;
  }
  .userHeadPic {
    position: absolute;
    height: @height;
    display: flex;
    align-items: center;
    img {
      width: 36px;
      height: 36px;
      border-radius: 50%;
    }
  }
  .login-reg-menu {
    width: 100px;
    top: @height;
    transform: translateX(-20%);
    position: absolute;
    /* 这里为什么不是left:3px; */
  }
}
.login-reg-menu,
.news-menue,
.create-menue {
  background-color: #fff;
  border-radius: 4px;
  box-shadow: 0 0 10px 2px rgba(0, 0, 0, 0.06);
  z-index: 9999999;
  border: 1px solid #c3c3c3;
}

.news-menue {
  position: absolute;
  width: 70px;
  top: @height;
}
.news-menue > a,
.login-reg-menu > a {
  display: block;
  text-align: center;
  margin-top: 8px;
}
#person {
  display: block;
  text-align: center;
  margin-top: 8px;
  cursor: pointer;
}
.login-reg-menu > #first-a {
  margin-top: 25px;
}
.create-menue {
  position: absolute;
  width: 130px;
  left: -50px;
  top: @height;
}
.create-menue a {
  display: block;
  text-align: center;
}
.create-menue a:nth-child(1) {
  /* background: url("../icon/编辑文章.png") no-repeat left center; */
}
.create-menue a:nth-child(2) {
  /* background: url("../icon/提问题.png") no-repeat left center; */
}
.create-menue a:nth-child(3) {
  /* background: url("../icon/上传资源.png") no-repeat left center; */
}
</style>