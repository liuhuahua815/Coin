// 导入数据库操作模块
const db = require('../db/index')

exports.uploadCourseFile = (req, res) => {
    // 1. 定义更新头像的 SQL 语句
    // const sql = `update user set img_path=? where user_id=?`
    // 2. 调用 db.query() 执行 SQL 语句
    let filename = "http://127.0.0.1:5000/" + req.file.destination + req.file.filename
    // console.log("filename is", filename);
    // db.query(sql, [filename, req.user.user_id], (err, results) => {
    //     // 执行 SQL 语句失败
    //     if (err) return res.cc(err)
    //     // 影响的行数是否等于 1
    //     if (results.affectedRows !== 1) return res.cc('更换头像失败！')
    //     // 成功
    //     res.send({
    //         filename: filename,
    //         message: '头像更换成功'
    //     })
    // })
    res.send({
        filename: filename,
        message: '文件上传成功'
    })
}