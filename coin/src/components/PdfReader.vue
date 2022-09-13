<template>
  <div><canvas id="thecanvas"></canvas></div>
</template>

<script>
// import * as PDFJS from "pdfjs-dist/legacy/build/pdf";
import * as pdfjsLib from "pdfjs-dist";
import pdfjsWorker from "pdfjs-dist/build/pdf.worker.entry";

export default {
  name: "PdfReader",

  data() {
    return {};
  },

  mounted() {},

  methods: {
    async reqPdf(filename) {
      // 设置pdf.worker.js文件的引入地址
      PDFJS.GlobalWorkerOptions.workerSrc = require("pdfjs-dist/legacy/build/pdf.worker.entry.js");
      // data是一个ArrayBuffer格式，也是一个buffer流的数据
      let res = await this.$API.reqCourseSourceByName(filename);
      console.log("res in pdfreader", res);
      let data = res.data;
      console.log("data in pdf", data);
      let uint8Array = new Uint8Array(data);
      PDFJS.getDocument(uint8Array).promise.then((pdfDoc) => {
        const numPages = pdfDoc.numPages; // pdf的总页数
        console.log("numpages is", numPages);
        // 获取第1页的数据
        pdfDoc.getPage(1).then((page) => {
          // 设置canvas相关的属性
          const canvas = document.getElementById("thecanvas");
          const ctx = canvas.getContext("2d");
          const dpr = window.devicePixelRatio || 1;
          const bsr =
            ctx.webkitBackingStorePixelRatio ||
            ctx.mozBackingStorePixelRatio ||
            ctx.msBackingStorePixelRatio ||
            ctx.oBackingStorePixelRatio ||
            ctx.backingStorePixelRatio ||
            1;
          const ratio = dpr / bsr;
          const viewport = page.getViewport({ scale: 1 });
          canvas.width = viewport.width * ratio;
          canvas.height = viewport.height * ratio;
          canvas.style.width = viewport.width + "px";
          canvas.style.height = viewport.height + "px";
          ctx.setTransform(ratio, 0, 0, ratio, 0, 0);
          const renderContext = {
            canvasContext: ctx,
            viewport: viewport,
          };
          // 数据渲染到canvas画布上
          page.render(renderContext);
        });
      });
    },
    async reqpdf(filename) {
      pdfjsLib.GlobalWorkerOptions.workerSrc = pdfjsWorker;
      let winW = document.documentElement.clientWidth;

      let res = await this.$API.reqCourseSourceByName(filename);
      console.log("res in pdfreader", res);
      let data = res.data;
      console.log("data in pdf", data);
      let uint8Array = new Uint8Array(data);
      console.log("unit8Array is", typeof uint8Array, uint8Array);
      let loadingTask = pdfjsLib.getDocument("uint8Array");
      console.log("loadingtask is", loadingTask);
      loadingTask.promise.then(
        (pdf) => {
          console.log(pdf);
          let pageNum = pdf.numPages;
          this.totalPage = pageNum;
          for (let i = 1; i <= pageNum; i++) {
            pdf.getPage(i).then((page) => {
              let viewport = page.getViewport({ scale: 1.5 });
              let scale = (winW / viewport.width).toFixed(2);
              let scaledViewport = page.getViewport({ scale: 1.5 });
              let canvas = document.getElementById("the-canvas" + i);
              let context = canvas.getContext("2d");
              canvas.height = scaledViewport.height;
              canvas.width = scaledViewport.width;
              let renderContext = {
                canvasContext: context,
                viewport: scaledViewport,
              };
              let renderTask = page.render(renderContext);
              renderTask.promise.then(() => {});
            });
          }
        },
        function (reason) {
          console.error("reason is", reason);
        }
      );
    },
  },
};
</script>

<style  scoped>
#thecanvas {
  border: 1px solid black;
}
</style>