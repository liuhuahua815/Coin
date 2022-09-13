<template>
  <el-form-item :label="label">
    <div class="info">
      <div
        class="origin"
        @mouseenter="iditIconShow = true"
        @mouseleave="iditIconShow = false"
      >
        <div class="originInfo">{{ originInfo }}</div>
        <i
          v-show="iditIconShow"
          class="el-icon-edit"
          @click="inputShow = true"
        ></i>
      </div>
      <div class="inputBox" v-show="inputShow">
        <el-input v-model="content"></el-input>
        <el-button type="primary" size="mini" @click.native="updateUserInfo"
          >保存</el-button
        >
        <el-button type="danger" size="mini" @click.native="inputShow = false"
          >取消</el-button
        >
      </div>
    </div>
  </el-form-item>
</template>

<script>
export default {
  name: "FormInput",
  props: ["label", "originInfo", "labelEng"],
  data() {
    return {
      iditIconShow: false,
      inputShow: false,
      content: "",
    };
  },
  methods: {
    async updateUserInfo() {
      this.inputShow = false;
      if (!this.content) {
        this.$message({
          message: "字段不能为空",
          type: "error",
          duration: 1500,
        });
      } else {
        try {
          let result = await this.$store.dispatch("updateUserInfo", [
            this.labelEng,
            this.content,
          ]);
          this.$message({
            message: "更改成功！",
            type: "success",
            duration: 1000,
          });
        } catch (e) {
          this.$message({
            message: e,
            type: "error",
            duration: 1500,
          });
        }
      }
    },
  },
};
</script>

<style lang="less" scoped>
.info {
  position: relative;
}
.origin {
  display: flex;
  align-items: center;
  .originInfo {
    box-sizing: border-box;
    padding: 0 20px;
    margin-right: 10px;
  }
  .el-icon-edit {
    font-size: 25px;
    color: #409eff;
    cursor: pointer;
  }
}
.inputBox {
  display: flex;
  position: absolute !important;
  top: 0;
  left: 0;
  width: 350px;
  justify-content: space-around;
  .el-input {
    width: 220px;
    height: 40px;
  }
}
</style>