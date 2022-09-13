<template>
  <div>
    <el-dialog
      id="file-upload-dialog"
      title="文件上传"
      :visible.sync="fileUploadVisible"
    >
      <div class="tip">
        仅支持上传pdf、docx、excel、pptx、txt、png、jpeg格式文件哦！
      </div>
      <div style="text-align: center" id="upload-btn" @click="selectFile">
        <MyIcon class="uploadbtn" type="uploadbtn" />
      </div>
      <div class="file-list">
        <div class="file-each" v-for="(file, key) in fileList" :key="key">
          <div class="file-each-up">
            <MyIcon class="file-type-icon" :type="file.name.split('.')[1]" />
            <div class="file-name" style="text-align: center">
              {{ file.name }}
            </div>
            <input
              style="width: 70%; height: 25px"
              type="text"
              placeholder="资源简介"
              v-model="file.intro"
            />
            <i class="el-icon-close" @click="fileList.splice(key, 1)"></i>
          </div>
          <div class="file-each-down">
            <!-- v-if="uploadProcessVisible && file.percentage != 100" -->
            <div v-if="uploadProcessVisible" style="width: 100%; display: flex">
              <el-progress
                style="width: 80%; margin-right: 20px"
                :text-inside="true"
                :stroke-width="26"
                :percentage="file.percentage"
                :status="file.status"
              ></el-progress>
              <el-button
                type="primary"
                size="small"
                @click="cancelUpload(key)"
                v-if="file.status == ''"
                >取消上传</el-button
              >
              <i
                class="el-icon-success"
                v-if="file.status == 'success'"
                style="color: #67c23a"
                >上传成功</i
              >
              <i
                class="el-icon-error"
                v-if="file.status == 'exception'"
                style="color: #f56c6c"
                >上传失败</i
              >
            </div>
          </div>
        </div>
        <el-button
          v-if="this.fileList.length"
          style="width: 100px; margin: 0 auto"
          icon="el-icon-upload"
          size="medium"
          @click="upload"
          >上传</el-button
        >
      </div>
    </el-dialog>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "FileUpload",
  data() {
    return {
      fileUploadVisible: false,
      uploadProcessVisible: false,
      fileList: [],
      fileType: ["pdf", "xlsx", "ppt", "txt", "docx", "png", "jpeg"],
      maxFileNum: 8,
    };
  },
  watch: {
    fileList() {
      if (this.fileList.length == 0) this.uploadProcessVisible = false;
    },
  },
  mounted() {},
  computed: {
    fileNameList() {
      let arr = [];
      this.fileList.forEach((i) => {
        arr.push(i.name);
      });
      return arr;
    },
  },
  methods: {
    selectFile() {
      //创建 input:file,并执行点击事件，跳出本机的文件系统
      let uploadElement = document.createElement("input");
      uploadElement.setAttribute("type", "file");
      uploadElement.setAttribute("multiple", "multiple");
      uploadElement.style.display = "none";
      if (window.addEventListener) {
        uploadElement.addEventListener("change", this.appendFile, false);
      } else {
        uploadElement.attachEvent("onchange", this.appendFile);
      }
      console.log("click", uploadElement);
      document.body.appendChild(uploadElement);
      uploadElement.click();
    },
    appendFile(e) {
      if (e && e.target.files) {
        let files = e.target.files;
        for (let i = 0; i < files.length; i++) {
          let type = files[i].name.split(".")[1];
          if (this.fileType.includes(type)) {
            if (!this.fileNameList.includes(files[i].name)) {
              this.fileList.push({
                file: files[i],
                name: files[i].name,
                percentage: 0,
                intro: "",
                status: "",
              });
            } else
              this.$message({
                message: "该文件已添加在上传列表了",
                type: "warning",
                time: 800,
              });
          } else {
            this.$message({
              message: `${files[i].name} 不是支持的文件格式`,
              type: "warning",
              time: 800,
            });
          }
        }
        if (this.fileList.length > this.maxFileNum)
          this.$message({
            message: `最多一次上传的文件数为${this.maxFileNum} ！`,
            type: "warning",
            time: 1000,
          });
      }
    },
    uploadFile(fileObj, index) {
      let formFile = new FormData();
      formFile.append("file", fileObj.file); //加入文件对象

      const controller = new AbortController(); //实现取消上传
      this.$set(this.fileList, index, {
        ...this.fileList[index],
        controller,
      });
      axios
        .post("http://localhost:5000/api/course/uploadCourseFile", formFile, {
          signal: controller.signal,
          onUploadProgress: (progressEvent) => {
            if (progressEvent.lengthComputable) {
              let jindu = Math.round(
                (progressEvent.loaded / progressEvent.total) * 100
              );
              // this.percentage = jindu;
              this.$set(this.fileList, index, {
                ...this.fileList[index],
                percentage: jindu,
              });
            } else console.log("不可测量");
          },
        })
        .then((res) => {
          this.$set(this.fileList, index, {
            ...this.fileList[index],
            status: "success",
          });
          // 进度条变成成功状态
          console.log(`${fileObj.name}上传成功`);
          setTimeout(() => {
            this.fileList.splice(index, 1);
          }, 3000);
        })
        .catch((thrown) => {
          if (axios.isCancel(thrown)) {
            this.$set(this.fileList, index, {
              ...this.fileList[index],
              status: "exception",
            });
            setTimeout(() => {
              this.fileList.splice(index, 1);
            }, 3000);
          } else {
            this.$message({ message: `thrown`, type: "error", time: 800 });
          }
        });
    },
    upload() {
      if (this.fileList.some((i) => i.intro == "")) {
        this.$message({
          type: "error",
          message: "请将文件的简介填写完整",
          time: 1000,
        });
        return;
      }
      this.uploadProcessVisible = true;
      this.fileList.forEach((fileObj, index) => {
        this.uploadFile(fileObj, index);
      });
    },
    cancelUpload(index) {
      console.log(`index${index}取消上传 `);
      let controller = this.fileList[index].controller;
      controller.abort();
      setTimeout(() => {
        this.fileList.splice(index, 1);
      }, 5000);
    },
  },
};
</script>

<style lang="less" scoped>
#file-upload-dialog {
  #upload-btn {
    width: 100px;
    height: 100px;
    position: relative;
    border: 2px dashed #ccc;
    margin: 20px auto;
  }
  .uploadbtn {
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    width: 40px;
    height: 40px;
    color: #bbb;
  }
  #upload-btn:hover {
    border-color: #409eff;
  }
  .file-list {
    display: flex;
    flex-wrap: wrap;
    flex-direction: column;
    .file-each {
      .file-each-up {
        display: flex;
        justify-content: flex-start;
        align-items: center;
        margin-bottom: 10px;
      }
      .file-each-down {
        display: flex;
        justify-content: center;
        align-items: center;
      }
      .file-name {
        width: 20%;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
      }
      .file-type-icon {
        width: 50px;
        height: 50px;
      }
    }
  }
  .el-icon-close:hover {
    color: #409eff;
  }
}
</style>