<template>
  <div>
    <Navigator v-show="$route.meta.showNav" />
    <router-view></router-view>
    <!-- <div class="editor-area"><EditBox /></div> -->
  </div>
</template>

<script>
import Navigator from "./components/Navigator.vue";
export default {
  name: "App",
  components: { Navigator },
  mounted() {},
  //===========================下面是解决刷新页面丢失vuex数据

  created() {
    if (sessionStorage.getItem("userInfo") && sessionStorage.getItem("token")) {
      console.log("设置了", this);
      this.$store.commit(
        "SET_USER",
        Object.assign({}, JSON.parse(sessionStorage.getItem("userInfo")))
      );
      this.$store.commit("SET_TOKEN", sessionStorage.getItem("token"));
    }
    window.addEventListener("beforeunload", () => {
      console.log("更新了");
      sessionStorage.setItem(
        "userInfo",
        JSON.stringify(this.$store.state.user.user)
      );
      sessionStorage.setItem("token", this.$store.state.user.token);
    });
  },
};
</script>

<style lang="less">
.editor-area {
  width: 60%;
  height: 700px;
}
* {
  margin: 0;
  padding: 0;
}
.icon {
  width: 1em;
  height: 1em;
  vertical-align: -0.15em;
  fill: currentColor;
  overflow: hidden;
}
</style>
