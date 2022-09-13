<template>
  <div>
    <div ref="file"></div>
  </div>
</template>

<script>
let docx = require("docx-preview");
export default {
  name: "DocxReader",
  data() {
    return {};
  },

  mounted() {},
  //  watch: {
  //   filename(newVal, oldVal) {
  //     if (newVal != "") {
  //       this.readWorkbookFromRemoteFile();
  //     }
  //   },
  // },
  updated() {
    console.log("updated docxReader");
  },
  methods: {
    async readWorkbookFromRemoteFile(filename) {
      console.log("触发了doxc请求数据");
      let res = await this.$API.reqCourseSourceByName(filename);
      let data = res.data;
      console.log(data); // 后端返回的是流文件
      docx.renderAsync(data, this.$refs.file); // 渲染到页面
    },
  },
  created() {
    console.log("create docxreader");
  },
};
</script>

<style lang="scss" scoped>
</style>