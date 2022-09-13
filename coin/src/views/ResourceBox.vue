<template>
  <div class="pageRoot">
    <el-container>
      <el-aside>
        <el-menu :default-openeds="['1', '3']">
          <el-submenu
            :index="index + ''"
            v-for="(value, name, index) in course"
            :key="index"
          >
            <template slot="title"
              ><i class="el-icon-message"></i>{{ name }}
            </template>
            <el-menu-item
              :index="item.id + ''"
              v-for="item in value"
              :key="item.id"
              >{{ item.coursename }}
            </el-menu-item>
          </el-submenu>
        </el-menu>
      </el-aside>
      <el-main style="min-width: 700px">
        <div class="layer1">
          <div class="title" style="font-weight: 700">课程简介</div>
          <div class="container">
            <!-- Image -->
            <div class="container__image">
              <img :src="bookurl" alt="" />
            </div>

            <!-- Right side -->
            <div class="container__feature">
              {{ courseIntro }}
            </div>
            <div class="container_teacher">
              <ul>
                <li style="font-weight: 700">授课老师</li>
                <li>刘花花</li>
                <li>林华话</li>
                <li>郑琪琪</li>
              </ul>
            </div>
          </div>
        </div>
        <div class="layer2">
          <div class="upload">
            <span
              style="
                padding: 5px;
                background-color: #ebf2f7;
                color: #333;
                border: 2px dashed #5bbef1;
              "
              >上传资源可以获得金币的奖励哦~</span
            >
            <el-button type="primary" size="small" @click="chooseFile"
              >上传资源</el-button
            >
          </div>
          <div class="title" style="font-weight: 700">课程资源下载</div>
          <el-table :data="tableData" border style="width: 100%">
            <el-table-column fixed prop="name" label="资源名称" width="250">
            </el-table-column>
            <el-table-column prop="instroduction" label="简介" width="400">
            </el-table-column>
            <el-table-column prop="nickname" label="上传作者" width="120">
            </el-table-column>
            <el-table-column prop="createtime" label="上传日期" width="120">
            </el-table-column>
            <el-table-column prop="coin_num" label="需金币数" width="80">
            </el-table-column>
            <el-table-column prop="download_times" label="下载次数" width="85">
            </el-table-column>
            <el-table-column fixed="right" label="操作" width="100">
              <template slot-scope="scope">
                <el-button @click="preview(scope.row)" type="text" size="small"
                  >预览</el-button
                >
                <el-button type="text" size="small">下载</el-button>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </el-main>
    </el-container>
    <el-dialog title="课程文件预览" :visible.sync="filePreviewVisible">
      <DocxReader v-show="filename.endsWith('docx')" ref="docx" />
      <ExcelReader v-show="filename.endsWith('xlsx')" ref="excel" />
      <PdfReader v-show="filename.endsWith('pdf')" ref="pdf" />
    </el-dialog>
    <FileUpload ref="FileUpload" />
  </div>
</template>

<script>
import FileUpload from "@/components/FileUpload.vue";
import DocxReader from "@/components/DocxReader.vue";
import ExcelReader from "@/components/ExcelReader.vue";
import PdfReader from "@/components/PdfReader.vue";
import MyIcon from "@/components/MyIcon.vue";
export default {
  name: "CoinResourceBox",
  components: { DocxReader, ExcelReader, PdfReader, MyIcon, FileUpload },
  data() {
    return {
      filename: "",
      filePreviewVisible: false,
      course: {},
      tableData: [],
      bookurl: "http://127.0.0.1:5000/static/book/高等数学.jpg",
      courseIntro: ` 上册以函数的知识作为过渡，以运动和变化的观点引出极限，再以极限研究函数的变化率，形成一元函数微分学;从面积问题引出定积分，并与微积分互为逆运算建立联系，形成微积分的基本定理，构成一元函数积分学。
下册通过空间解析几何和向量代数，进一步把一元函数微积分学推广到多元函数微积分学上。`,
    };
  },
  computed: {},

  mounted() {
    this.getCourseType();
    this.reqCourseRecourseById();
  },

  methods: {
    chooseFile() {
      this.$refs.FileUpload.fileUploadVisible = true;
    },
    async getCourseType() {
      try {
        let result = await this.$API.reqCourseType();
        let course = JSON.parse(result.data.course);
        this.course = course;
      } catch (e) {
        this.$message({
          message: "课程分类请求失败",
          type: "error",
          duration: 3000,
        });
      }
    },
    async reqCourseRecourseById() {
      try {
        let result = await this.$API.reqCourseRecourseById(1);
        this.tableData = JSON.parse(result.data.resourse);
        this.tableData.forEach((obj) => {
          let str = obj.createtime;
          let dateStr = new Date(str);
          let each = [];
          each.push(dateStr.getFullYear());
          each.push(dateStr.getMonth() + 1);
          each.push(dateStr.getDate());
          obj.createtime = each.join("-");
        });
      } catch (e) {
        this.$message({
          message: e,
          type: "error",
          duration: 3000,
        });
      }
    },
    preview({ name }) {
      this.filename = name;
      this.filePreviewVisible = true;
      if (this.filename.endsWith("xlsx")) {
        // this.$bus.$emit("previewExcel", this.filename);
        this.$nextTick(() => {
          this.$refs.excel.readWorkbookFromRemoteFile(this.filename);
        });
      } else if (this.filename.endsWith("docx")) {
        this.$nextTick(() => {
          this.$refs.docx.readWorkbookFromRemoteFile(this.filename);
        });
      } else if (this.filename.endsWith("pdf")) {
        this.$nextTick(() => {
          this.$refs.pdf.reqpdf(this.filename);
        });
      }
    },
  },
};
</script>

<style lang="less" scoped>
.pageRoot {
  display: flex;
  justify-content: center;
  padding: 30px;
}
.layer1 {
  .container {
    display: flex;

    /* OPTIONAL: Reverse the order of image and content */
    // flex-direction: row-reverse;

    /* OPTIONAL: Spacing between items */
    margin: 16px 0;
  }

  .container__image {
    img {
      width: 270px;
      height: 250px;
    }
    width: 300px;
  }

  .container__feature {
    /* Take the remaining width */
    flex: 1;
    margin: 20px;
    text-indent: 2em;
    background-color: #fff;
  }
  .container_teacher {
    ul {
      list-style: none;
      li {
        height: 40px;
        line-height: 40px;
        text-align: center;
        cursor: pointer;
      }
      li:hover {
        background-color: #f5f7f8;
      }
    }
    width: 100px;
    height: 250px;
    padding: 5px;
    background-color: #fff;
  }
}
.layer2 {
  .upload {
    display: flex;
    justify-content: space-around;
    width: 400px;
    margin-bottom: 20px;
  }
}
</style>