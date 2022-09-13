const express = require('express')
const app = express()

const joi = require('@hapi/joi')

// 导入并配置 cors 中间件
const cors = require('cors')
app.use(cors())

// 配置解析表单数据的中间件，注意：这个中间件，只能解析 application/x-www-form-urlencoded 格式的表单数据
app.use(express.urlencoded({ extended: false }))
app.use(express.json());


// 托管静态资源文件
app.use('/upload', express.static('./upload'))
app.use('/static', express.static('./static'))

// 一定要在路由之前，封装 res.cc 函数
app.use((req, res, next) => {
    // status 默认值为 1，表示失败的情况
    // err 的值，可能是一个错误对象，也可能是一个错误的描述字符串
    res.cc = function (err, status = 1) {
        res.send({
            status,
            message: err instanceof Error ? err.message : err,
        })
    }
    next()
})

// 一定要在路由之前配置解析 Token 的中间件
const expressJWT = require('express-jwt')
const config = require('./config')

app.use(expressJWT({ secret: config.jwtSecretKey, algorithms: ['HS256'] }).unless({ path: [/^\/api/] }))

// 导入并使用用户路由模块
const userRouter = require('./router/user')
app.use('/api', userRouter)

const viewRouter = require('./router/view')
app.use('/api/view', viewRouter)

const courseRouter = require('./router/course')
app.use('/api/course', courseRouter)

// 导入并使用用户信息的路由模块
const userinfoRouter = require('./router/userinfo')
app.use('/my/userInfo', userinfoRouter)
// 导入并使用问题的路由模块
const questionRouter = require('./router/question')
app.use('/my/question', questionRouter)
// // 导入并使用笔记的路由模块
// const articleRouter = require('./router/note')
// app.use('/my/note', articleRouter)

// 定义错误级别的中间件
app.use((err, req, res, next) => {
    // 验证失败导致的错误
    if (err instanceof joi.ValidationError) return res.cc(err)
    // 身份认证失败后的错误
    if (err.name === 'UnauthorizedError') return res.cc('身份认证失败！')
    // 未知的错误
    res.cc(err)
})

app.listen(5000, () => {
    console.log('http:127.0.0.1:5000 with coin is running');
})

