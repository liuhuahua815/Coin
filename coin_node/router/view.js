const express = require('express')
const router = express.Router()


const view_handler = require('../router_handler/view')
const fileConfig = require('../common/uploadFile')
// 获取问题列表
router.get('/regQList', view_handler.regQList)
// 获取问题标签
router.get('/regQTags', view_handler.reqQTags)
// 根据问题id获取问题
router.get('/reqQuestionById', view_handler.reqQuestionById)
// 上传图片的image

// 根据问题id获取问题对应的回答
router.get('/reqAnswerById', view_handler.reqAnswerById)


const upload = fileConfig.setStorageConfig('upload/questionImage/')

router.post('/upload/questionImage', upload.single('file'), view_handler.uploadQImage);
router.get('/reqCourseType', view_handler.reqCourseType)

//根据课程id获取课程资源
router.get('/reqCourseRecourseById', view_handler.reqCourseRecourseById)



// 引入文件模块 
const fs = require("fs")

// 返回word文件接口
router.get('/getDoc', view_handler.regDocx)


module.exports = router