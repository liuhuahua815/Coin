// 对api进行统一管理
import requests from "./request";

export const reqTags = () => requests({ url: '/students', method: 'get' })

// 用户注册
export const reqUserRegister = (data) => requests({ url: 'api/userReg', data, method: 'post' })

//用户登录
export const reqUserLogin = (data) => requests({ url: 'api/userLogin', data, method: 'post' })


// 发布问题标签获取
export const reqQuestionTags = () => requests({ url: 'api/view/regQTags', method: 'get' })

//提交问题
export const addQuestion = (data) => requests({ url: 'my/question/addQuestion', data, method: 'post' })

//获取问题列表
export const reqQList = () => requests({ url: 'api/view/regQList', method: 'get' })

// 上传问题图片
export const uploadQImage = (data) => requests({ url: 'api/view/upload/questionImage', data, method: 'post' })

//提交回答
export const addAnswer = (data) => requests({ url: 'my/question/addAnswer', data, method: 'post' })

// 上传个人头像
export const updateAvatar = (data) => requests({ url: 'my/userInfo/updateAvatar', data, method: 'post' })

// 更新用户信息
export const updateUserInfo = (data) => requests({ url: 'my/userInfo/updateUserInfo', data, method: 'post' })

// 根据id获取问题
export const reqQuestionById = (id) => requests({ url: 'api/view/reqQuestionById', params: { q_id: id }, method: 'get' })

//根据问题id获取问题的回答
export const reqAnswerById = (id) => requests({ url: 'api/view/reqAnswerById', params: { q_id: id }, method: 'get' })

// 获取课程分类
export const reqCourseType = () => requests({ url: 'api/view/reqCourseType', method: 'get' })

//根据课程id获取课程资源
export const reqCourseRecourseById = (id) => requests({ url: 'api/view/reqCourseRecourseById', method: 'get', params: { course_id: id } })

export const reqCourseSourceByName = (filename) => requests({
    method: "get", responseType: 'arraybuffer', url: 'api/view/getDoc', params: { filename }
})

/* //上传课程文件
export const uploadCourseFile = (data)=> requests({
    url: "api/course/uploadCourseFile",
    data: data,
    method:'post',
    onUploadProgress: function (progressEvent) {
      this.process = Math.round(
        (progressEvent.loaded / progressEvent.total) * 100
      );
    },
  }) */