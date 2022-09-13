<template>
  <div>
    <div class="toolbar-top"></div>
    <div class="note-display">
      <div class="line-each" id="first-line"></div>
      <div class="line-each" id="second-line"></div>
      <div class="page">
        <ul id="menu">
          <li><a href="#">Previous</a></li>
          <span class="add-page"> </span>
          <li><a href="#">Next</a></li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "NotebookList",
};
</script>

<style scoped>
* {
  text-decoration: none;
  list-style: none;
  margin: 0;
  padding: 0;
}
body {
  background-color: #f5f7f8;
}
.note-display {
  margin-left: 80px;
  width: 80%;
  height: 700px;
  border: 1px solid #fff;
  padding: 30px;
}
.line-each {
  width: 100%;
  height: 320px;
  display: flex;
  justify-content: space-evenly;
}
.note-item {
  background-color: #fff;
  border: 1px solid #ccc;
  border-radius: 5px;
  width: 250px;
  height: 300px;
}
.count {
  margin-top: 20px;
  display: flex;
  margin-left: 10px;
}
.note-intro {
  background-color: #cbe2ee;
  height: 100px;
  padding: 5px;
}
.info-each {
  margin-top: 10px;
  text-indent: 2em;
  border-bottom: 1px dashed #c3c3c3;
}
.page {
  margin-left: 35%;
}
</style>