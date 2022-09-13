<template>
  <svg class="icon" aria-hidden="true">
    <!--  记得此处的计算属性需要和‘#’拼接 -->
    <use :xlink:href="'#' + fontClass"></use>
  </svg>
</template>

<script>
// 创建一个映射表，能更方便地设置Icon样式，
// 以后如果需要更换图标，也只需要更换映射表里的属性值。
const classMap = {
  photo: "Myicon-paizhao",
  coin: "Myicon-jinbi",
  uploadbtn: "Myicon-shangchuan1",
  cancel: "Myicon-yiquxiao",
  docx: "Myicon-doc",
  jpg: "Myicon-jpg",
  png: "Myicon-png",
  ppt: "Myicon-ppt",
  pdf: "Myicon-pdf",
  xlsx: "Myicon-xls",
  txt: "Myicon-txt",
};
export default {
  name: "MyIcon",
  props: {
    type: {
      type: String,
      require: true,
    },
  },
  computed: {
    fontClass() {
      return classMap[this.type];
    },
  },
};
</script>

<style type="text/css">
.icon {
  width: 1em;
  height: 1em;
  vertical-align: -0.15em;
  fill: currentColor;
  overflow: hidden;
}
</style>
