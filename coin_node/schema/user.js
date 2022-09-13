// 导入定义验证规则的包
const joi = require('joi')

// 定义用户名和密码的验证规则
const username = joi.string().min(1).max(8).required()
const password = joi
    .string()
    .pattern(/^[\S]{6,12}$/)
    .required()

// 定义 id, nickname, email 的验证规则
const grade = joi.string()
const sex = joi.string()
const major = joi.string()
const age = joi.number().min(16).max(100)

// 定义验证 avatar 头像的验证规则
const avatar = joi.string().dataUri().required()

// 定义验证注册和登录表单数据的规则对象
exports.reg_login_schema = {
    body: {
        username,
        password,

    },
}

// 验证规则对象 - 更新用户基本信息
exports.update_userinfo_schema = {
    // 需要对 req.body 里面的数据进行验证
    body: {
        grade,
        sex,
        major,
        age
    },
}

// 验证规则对象 - 更新密码
exports.update_password_schema = {
    body: {
        oldPwd: password,
        newPwd: joi.not(joi.ref('oldPwd')).concat(password),
    },
}

// 验证规则对象 - 更新头像
exports.update_avatar_schema = {
    body: {
        avatar
    }
}
