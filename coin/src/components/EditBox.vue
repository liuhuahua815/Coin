<template>
  <div class="content-input-box">
    <div class="toolbar">
      <div class="toolbar-left">
        <span
          :class="isShow ? 'addUnderLine' : ''"
          id="edit-btn"
          @click="isShow = !isShow"
          >编辑</span
        >
        <span
          :class="!isShow ? 'addUnderLine' : ''"
          id="preview-btn"
          @click="isShow = !isShow"
          >预览</span
        >
      </div>
      <div class="toolbar-right">
        <span v-for="(option, index) in imgPath" :key="index">
          <img
            :src="option"
            @mouseenter="changeImgPath(index)"
            @mouseleave="changeImgPath(index)"
            @click="chooseImg(index)"
          />
        </span>
      </div>
    </div>
    <div class="content-input" v-show="isShow">
      <div class="content">
        <textarea ref="singleText" v-model="markdownVal"></textarea>
      </div>
    </div>
    <div class="content-output" v-show="!isShow">
      <div class="content">
        <div v-html="markdownHtml" class="markdown-body"></div>
      </div>
    </div>
    <!-- <div class="alert-box-item">
      <div class="bigImg-div" @click="toGetImg">
        <img class="bigImg" :src="valueUrl" v-if="valueUrl" />
      </div>
    </div> -->
  </div>
</template>

<script>
import showdown from "showdown";
var converter = new showdown.Converter();
//显示table
converter.setOption("tables", true);
converter.setOption("tasklists", true);
let inputElement = null;
export default {
  name: "EditBox",
  data() {
    return {
      markdownVal: "",
      editOptions: ["加粗", "斜体", "代码", "超链接", "图片", "表格"],
      isShow: true,
      valueUrl: "",
    };
  },
  computed: {
    imgPath() {
      return this.editOptions.map((each) =>
        require(`../assets/icons/富文本编辑器/富文本编辑器_${each}.png`)
      );
    },
    markdownHtml() {
      return converter.makeHtml(this.markdownVal);
    },
  },
  watch: {
    markdownVal(newVal) {
      console.log("editbox transfer data to other page");
      console.log("the markdownVal is ", newVal);
      this.$emit("markdownTransf", converter.makeHtml(newVal));
    },
  },
  methods: {
    async insert(myValue) {
      // const myField = document.querySelector('#textarea');
      const myField = this.$refs.singleText;
      if (myField.selectionStart || myField.selectionStart === 0) {
        var startPos = myField.selectionStart;
        var endPos = myField.selectionEnd;

        if (endPos != startPos) {
          this.markdownVal =
            myField.value.substring(0, startPos) +
            myValue +
            myField.value.substring(startPos, endPos) +
            myValue +
            myField.value.substring(endPos, myField.value.length);
          await this.$nextTick(); // 这句是重点, 圈起来
          myField.focus();
          myField.setSelectionRange(
            endPos + myValue.length,
            endPos + myValue.length
          );
        } else {
          this.markdownVal =
            myField.value.substring(0, startPos) +
            myValue +
            myValue +
            myField.value.substring(endPos, myField.value.length);
          await this.$nextTick(); // 这句是重点, 圈起来
          myField.focus();
          myField.setSelectionRange(
            endPos + myValue.length,
            endPos + myValue.length
          );
        }
      } else {
        this.markdownVal += myValue;
      }
    },
    chooseImg(index) {
      console.log("点击了");
      if (this.editOptions[index] == "加粗(1)") {
        this.insert("**");
      }
      if (this.editOptions[index] === "图片(1)") {
        this.toGetImg();
      }
      if (this.editOptions[index] === "斜体(1)") {
        this.insert("_");
      }
      if (this.editOptions[index] === "表格(1)") {
        this.markdownVal +=
          "\n| 表头 | 表头 |\n| ------ | ------ |\n| 单元格 | 单元格 |\n| 单元格 | 单元格 |\n";
      }
      if (this.editOptions[index] === "代码(1)") {
        this.markdownVal += "\n";
        this.insert("```");
      }
    },
    changeImgPath(index) {
      if (this.editOptions[index].includes("(1)")) {
        this.editOptions[index] = this.editOptions[index].replace("(1)", "");
        this.$set(
          this.editOptions,
          index,
          this.editOptions[index].replace("(1)", "")
        );
      } else {
        let lis = this.editOptions[index].split("");
        lis.push("(1)");
        lis = lis.join("");
        this.$set(this.editOptions, index, lis);
      }
    },
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
          myFormData.append("address", "questionImage");
          console.log("formdata is", myFormData);
          var result = await this.$API.uploadQImage(myFormData);
          // console.log("上传的结果为", result.data);
          // var url = URL.createObjectURL(file);
          var url = result.data.filename;
          this.markdownVal += `![img](${url})`;
          this.$nextTick();
          console.log("img url is", url);
        }
      }
    },
  },
  beforeDestroy() {
    if (inputElement) {
      if (window.addEventListener) {
        inputElement.removeEventListener("change", this.onGetLocalFile, false);
      } else {
        inputElement.detachEvent("onchange", this.onGetLocalFile);
      }
      document.body.removeChild(inputElement);
      inputElement = null;
      console.log("========inputelement destroy");
    }
  },
};
</script>


<style lang="less" scoped>
.alert-box-item {
  overflow: hidden;
}

.bigImg-div {
  width: 200px;
  height: 200px;
  border-radius: 100%;
  overflow: hidden;
  border: 1px solid #ddd;
}

.bigImg {
  display: block;
  width: 200px;
  height: 200px;
  border-radius: 100%;
}

@import "@/assets/css/github-markdown.css";
div {
  box-sizing: border-box;
}
.content-input-box {
  border-radius: 4px;
  border: 1px solid #ccccd8;
  height: 100%;
  width: 100%;
}
.toolbar {
  padding: 15px 15px 0px;
  border-bottom: 1px solid #ccc;
  min-height: 40px;
  height: 7%;
}
.toolbar-left {
  float: left;
}
.toolbar-right {
  float: right;

  span {
    margin-left: 5px;
  }

  img {
    width: 23px;
    height: 23px;
    cursor: pointer;
  }
}
.content-input,
.content-output {
  height: 93%;
}
.content {
  padding: 15px;
  width: 100%;
  height: 90%;
  overflow-y: scroll;
}
textarea {
  display: block;
  box-sizing: border-box;
  width: 100%;
  height: 100%;
  outline: none;
  padding: 0.5rem;
  overflow-y: scroll;
}
/*Github主题要求的样式引入*/
.markdown-body {
  box-sizing: border-box;
  max-width: 760px;
  max-height: 615px;
  overflow-y: scroll;
  margin: 0 auto;
  padding: 5px;
}
.markdown-body img {
  max-width: 100%;
  max-height: 600px;
}
@media (max-width: 767px) {
  .markdown-body {
    padding: 15px;
  }
}
#edit-btn,
#preview-btn {
  cursor: pointer;
  padding: 2px;
}
.addUnderLine {
  border-bottom: 1px solid black;
}
</style>