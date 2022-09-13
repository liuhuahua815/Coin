const express = require('express')
const router = express.Router()

const question_handler = require('../router_handler/question')

// 发布问题
router.post('/addQuestion', question_handler.addQuestion)
// 提交问题
router.post('/addAnswer', question_handler.addAnswer)


module.exports = router