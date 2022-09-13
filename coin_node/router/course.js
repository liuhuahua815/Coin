const express = require('express')
const router = express.Router()

const course_handler = require('../router_handler/course')

const fileConfig = require("../common/uploadFile")
const upload = fileConfig.setStorageConfig('upload/courseFile/')
// 更换头像的路由
router.post('/uploadCourseFile', upload.single('file'), course_handler.uploadCourseFile)
module.exports = router