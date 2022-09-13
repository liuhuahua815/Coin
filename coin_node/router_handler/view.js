const { CLIENT_MULTI_RESULTS } = require('mysql/lib/protocol/constants/client');
const db = require('../db/index')

exports.regQList = (req, res) => {
    const sql = ' SELECT * FROM question';
    db.query(sql, (err, result) => {
        if (err) return res.cc(err)
        // console.log('result is', JSON.stringify(result))
        res.send({
            questionList: JSON.stringify(result)
        })
    })

}

exports.reqQTags = (req, res) => {
    const sql = ' SELECT * FROM tag';
    db.query(sql, (err, result) => {
        if (err) return res.cc(err)
        obj = {}
        result.forEach(element => {
            let type = element['tag_type']
            let name = element['tag_name']
            if (!obj[type]) {
                var arr = []
                arr.push(name)
                obj[type] = arr
            } else {
                obj[type].push(name)
            }
        });
        res.send({
            tags: JSON.stringify(obj)
        })
    })

}
exports.uploadQImage = (req, res) => {
    console.log("文件上传的结果", req.file);
    res.send({
        filename: "http://127.0.0.1:5000/" + req.file.destination + req.file.filename,
        message: '图片上传成功'
    })
}
exports.reqQuestionById = (req, res) => {
    const sql = "select * from question where q_id=?"
    // 执行 SQL 语句
    db.query(sql, req.query.q_id, (err, results) => {
        if (err) return res.cc(err)
        res.send({
            question: JSON.stringify(results[0])
        })
    })

}
exports.reqCourseType = (req, res) => {
    const sql = "select course_name,course_grade,course_id from course"
    db.query(sql, (err, results) => {
        if (err) return res.cc(err)
        obj = {}
        results.forEach(element => {
            let type = element['course_grade']
            let name = element['course_name']
            let id = element['course_id']
            let detail = {}
            detail['id'] = id
            detail['coursename'] = name
            if (!obj[type]) {
                var arr = []
                arr.push(detail)
                obj[type] = arr
            } else {
                obj[type].push(detail)
            }
        });
        // console.log("obj in reqCourseType is", obj);
        res.send({
            course: JSON.stringify(obj)
        })
    })
}

exports.reqAnswerById = (req, res) => {
    console.log('请求answer', req.query.q_id);
    const sql = "SELECT a.*,u.`nickname`,u.`img_path` FROM answer a INNER JOIN USER u WHERE a.`user_id`=u.`user_id` AND a.`q_id`=?"
    db.query(sql, req.query.q_id, (err, results) => {
        if (err) return res.cc(err)
        console.log("RESULT IS", results);
        res.send({
            answer: JSON.stringify(results)
        })
    })
}

exports.reqCourseRecourseById = (req, res) => {
    console.log('请求course', req.query.course_id);
    const sql = "SELECT c.*,u.`nickname`,u.`img_path` FROM course_resource c INNER JOIN USER u WHERE c.`user_id`=u.`user_id` AND c.`course_id`=?"
    db.query(sql, req.query.course_id, (err, results) => {
        if (err) return res.cc(err)
        console.log("RESULT IS", results);
        res.send({
            resourse: JSON.stringify(results)
        })
    })
}
const path = require("path")     //node的内置模块
const fs = require("fs")
// 获取docx文档
exports.regDocx = (req, res) => {
    let filename = req.query.filename
    if (filename) {
        // 软工1904通讯录.xlsx
        let filePath = path.resolve(__dirname, '../', 'static', 'courseResource', filename);
        console.log(filePath);
        let fileStream = fs.createReadStream(filePath);

        // let buffers = [];
        // fileStream.on('error', reject);

        // fileStream.on('data', (data) => buffers.push(data));
        // fileStream.on('end', Buffer.concat(buffers));

        let stat = fs.statSync(filePath);
        res.setHeader('Content-Length', stat.size);
        res.setHeader('Content-Type', 'application/octet-stream');
        // res.setHeader('Content-type', 'application/pdf ')
        res.writeHead(200, {
            // 指定文件类型为docx
            // 'Content-Type': 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
        })

        // res.setHeader('Content-Disposition', 'attachment; filename=test2.xlsx');

        fileStream.pipe(res);
        // res.send(buffers)application/octet-stream
    }
}
