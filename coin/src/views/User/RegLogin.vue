<template>
  <div class="pageRoot">
    <div class="center-box">
      <div class="center-box-content">
        <div class="note-box">
          <div class="note">
            <h2>广外信息加油站</h2>
            <p>
              旨在为广外信息学院的学子提供一个学习资源整合和交流、学习记录的平台。
            </p>
            <p>
              在这里，你可以轻松获得各年级专业课的电子资源、课堂PPT、思政复习大礼包。
            </p>
            <p>
              除此之外，你还可以发布作业问题获得学长学姐的解答。更多的惊喜等待你发现……
            </p>
          </div>
        </div>
        <div v-show="isLoginBox" class="login-reg-box">
          <div class="login-box">
            <form class="login-form-list">
              <ul class="login-table">
                <li>
                  <input
                    type="text"
                    name="nickname"
                    id="username"
                    placeholder="用户名"
                    v-model="loginUsername"
                  />
                </li>
                <li>
                  <input
                    type="password"
                    name="password"
                    placeholder="密码"
                    v-model="loginPWD"
                  />
                </li>
                <li>
                  <div id="login-btn" @click="userLogin">登录</div>
                </li>
                <li>
                  没有账号？点击<span id="reg" @click="isLoginBox = false"
                    >注册</span
                  >
                </li>
              </ul>
            </form>
          </div>
        </div>
        <div v-show="!isLoginBox" class="reg-form-box">
          <div class="reg-form">
            <form class="reg-form-list">
              <div class="form-item">
                <label for="nickname">用户昵称:</label>
                <input
                  type="text"
                  name="nickname"
                  id="nickname"
                  v-model="regUsername"
                />
              </div>
              <div class="form-item set-password">
                <label for="password">设置密码:</label>
                <input
                  type="password"
                  name="password"
                  id="password"
                  v-model="regPWD"
                />
                <div class="inform">
                  <div class="inform-text"></div>
                </div>
              </div>
              <div class="form-item check-password">
                <label for="check-password">确认密码:</label>
                <input
                  type="password"
                  name="check-password"
                  id="check-password"
                  v-model="regPWD1"
                />
                <div class="inform-sec">
                  <div class="inform-sec-text"></div>
                </div>
              </div>
              <div class="form-item">
                <div id="reg-btn" @click="userRegister">注册</div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "RegLogin",
  data() {
    return {
      isLoginBox: true,
      loginUsername: "",
      loginPWD: "",
      regUsername: "",
      regPWD: "",
      regPWD1: "",
    };
  },
  methods: {
    async userRegister() {
      const { regUsername, regPWD, regPWD1 } = this;
      if (!regUsername) {
        alert("用户昵称不能为空");
      } else if (regPWD != regPWD1) {
        alert("密码不一致");
      } else {
        try {
          //  如果成功路由跳转至登录界面

          await this.$store.dispatch("userRegister", {
            username: regUsername,
            password: regPWD,
          });
          // console.log(this.$message);
          this.$message({
            message: "注册成功",
            type: "success",
            duration: 1000,
          });
          this.isLoginBox = true;
        } catch (e) {
          this.$message({
            message: e,
            type: "error",
            duration: 5000,
          });
          // alert(error.message);
        }
      }
    },
    async userLogin() {
      const { loginUsername, loginPWD } = this;
      if (loginUsername && loginPWD) {
        try {
          let result = await this.$store.dispatch("userLogin", {
            username: loginUsername,
            password: loginPWD,
          });
          this.$message({
            message: "登录成功",
            type: "success",
            duration: 1000,
          });
          this.$bus.$emit("updateUserHeadPic", result.imgPath); // xxx指的是自定义事件
          // 判断登录的组件URL：是否有query参数【即为用户未登录时候，想去而没有去成的路由】
          let toPath = this.$route.query.redirect || "/Resource";
          this.$router.push(toPath);
        } catch (e) {
          this.$message({
            message: e,
            type: "error",
            duration: 5000,
          });
        }
      } else {
        alert("账号或者密码不能为空");
      }
    },
  },
};
</script>

<style scoped>
* {
  list-style: none;
  text-decoration: none;
}
body {
  min-width: 1200px;
}
.center-box {
  width: 100%;
  background: url(~@/assets/imgs/wallpaper1.jpg) no-repeat;
  background-size: cover;
  min-height: 600px;
  position: relative;
  top: 50px;
}
.center-box-content {
  /* background:transparent; */
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  height: 376px;
  width: 1000px;
  clear: both;
  max-width: 1520px;
}
.note-box {
  width: 419px;
  height: 300px;
  height: 100%;
  float: left;
}
.note p {
  width: 100%;
  height: 100%;
  background: transparent;
  color: white;
  line-height: 34px;
  font-size: 20px;
  text-indent: 2em;
}
.login-reg-box {
  margin-left: 80px;
  width: 400px;
  height: 300px;
  float: right;
  border-radius: 8px;
  background-color: #ebecef;
  opacity: 0.9;
}
.login-box {
  margin: 50px 40px;
  font-size: 20px;
  color: #000;
}
.login-table > li {
  margin-top: 20px;
}
#reg {
  cursor: pointer;
  font-weight: 700;
}
.login-table > li > input {
  display: block;
  width: 300px;
  height: 40px;
  border-radius: 6px 6px;
  background: #fff;
  font-size: 20px;
  border: none;
}
#submit-btn {
  background: skyblue;
}
.reg-form-box {
  margin-left: 100px;
  width: 400px;
  height: 400px;
  float: right;
  border-radius: 8px;
  background-color: #ebecef;
  opacity: 0.9;
  box-sizing: content-box;
  position: relative;
}
.form-item {
  margin-top: 20px;
}
.reg-form {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 300px;
}
.form-item input {
  width: 200px;
  height: 25px;
  background: #fff;
  font-size: 20px;
  border: none;
}
#reg-btn,
#login-btn {
  border-radius: 4px;
  background-color: rgb(78, 146, 243);
  color: #fff;
  width: 120px;
  height: 30px;
  margin-left: 90px;
  text-align: center;
  cursor: pointer;
}
.set-password,
.check-password {
  position: relative;
  width: 500px;
}

.inform,
.inform-sec {
  position: absolute;
  left: 300px;
  top: 0;
  height: 32px;
  line-height: 32px;
  font-size: 15px;
  background-repeat: no-repeat;
  background-position: left center;
}
.inform-text,
.inform-sec-text {
  margin-left: 40px;
}
</style>