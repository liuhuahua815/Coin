const multer = require('multer');//multer插件
const md5 = require('md5')


exports.setStorageConfig = function (savePath) {
    var storage = multer.diskStorage({
        destination: function (req, file, cb) {
            cb(null, savePath)
            //文件保存路径
        },
        filename: function (req, file, cb) {
            let fileFormat = (file.originalname).split(".");
            cb(null, md5(+new Date() + "huaisthebest") + "." + fileFormat[fileFormat.length - 1]);
            //存储文件名
        }
    })
    var upload = multer({ storage: storage })
    return upload
}
