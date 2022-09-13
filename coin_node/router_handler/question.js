const { result } = require('@hapi/joi/lib/base');
const { CLIENT_MULTI_RESULTS } = require('mysql/lib/protocol/constants/client');
const db = require('../db/index')


// exports.reqQList = (req,res)=>{
//     const sql = "SELECT t.tag_name FROM tag_question AS tq LEFT JOIN tag AS t ON tq.tag_id=t.tag_id WHERE tq.q_id = ?"
//     db.query(sql,)
// }
exports.addQuestion = (req, res) => {
    console.log('解析出的用户信息', req.user);
    console.log('用户发布问题', req.body);
    const sql = "insert into question set ?"
    db.query(sql, req.body, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) return res.cc('发布新问题失败！')
        // console.log("result is ", results);
        res.send({
            "q_id": results.insertId
        })
    })
}
exports.addAnswer = (req, res) => {
    console.log('用户提交的问题为', req.body);
    const sql = "insert into answer set ?"
    let answer_id
    let user_id = req.body.user_id
    console.log("user_id is", user_id);
    let user = {}
    db.query(sql, req.body, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) return res.cc('提交回答失败！')
        console.log('插入的数据为', results);
        answer_id = results.insertId

        const sql1 = `select * from user where user_id=?`
        db.query(sql1, user_id, (err, results) => {
            if (err) return res.cc(err)
            if (results.length !== 1) return res.cc('提交回答失败！')
            console.log('results is', results);
            user['img_path'] = results[0].img_path
            user['nickname'] = results[0].nickname
            console.log("查询到的 user is", user);
            res.send({
                "answer_id": answer_id,
                "user": user
            })
        })

    })

}
