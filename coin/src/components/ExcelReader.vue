<template>
  <div>
    <div id="table">
      <el-table :data="excelData" height="90vh" border style="width: 90%">
        <el-table-column
          :prop="item"
          v-for="(item, index) in thead"
          :key="index"
          :label="item"
        >
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script>
import { read, utils } from "xlsx";
export default {
  name: "ExcelReader",
  data() {
    return {
      excelData: [],
      workbook: {},
    };
  },
  computed: {
    thead() {
      let res = [];
      this.excelData.forEach((i) => {
        for (let j in i) {
          if (!res.includes(j)) res.push(j);
        }
      });
      return res;
    },
  },
  methods: {
    async readWorkbookFromRemoteFile(filename) {
      console.log("响应事件");
      console.log("filename is", filename);
      let res = await this.$API.reqCourseSourceByName(filename);
      let data = res["data"];
      var workbook = read(data, { type: "array" });
      console.log("workbook", workbook);

      var sheetNames = workbook.SheetNames; // 工作表名称集合
      this.workbook = workbook;
      this.getTable(sheetNames[0]);
    },
    getTable(sheetName) {
      console.log("执行了getTable");
      console.log(sheetName);
      var worksheet = this.workbook.Sheets[sheetName];
      this.excelData = utils.sheet_to_json(worksheet);
      console.log(this.excelData);
    },
  },
  mounted() {
    console.log("mount excelreader");
    // this.$bus.$on("previewExcel", (filename) => {
    //   console.log("触发到了 excelReader", filename);
    // });
  },
  updated() {
    console.log("update excelreader");
  },
  created() {
    console.log("created excelreader");
    // this.$bus.$on("previewExcel", this.readWorkbookFromRemoteFile);
  },
};
</script>

<style lang="scss" scoped>
</style>