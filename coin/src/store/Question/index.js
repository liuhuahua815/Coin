import { reqTags, reqQuestionTags, addQuestion, reqQList, addAnswer } from '@/api'
//Question模块的小仓库
const state = {
    // state中数据默认初始值根据接口返回值决定
    QTypeList: [],
    QuestionTags: {},
    PostedQuestion: {},
    QuestionList: [],
    QuestionContent: {}
}
const mutations = {
    QTYPELIST(state, QTypeList) {
        state.QTypeList = QTypeList
    },
    QUESTIONTAGS(state, QuestionTags) {
        state.QuestionTags = QuestionTags
    },
    QuestionList(state, QuestionList) {
        state.QuestionList = QuestionList
    },
    QuestionContent(state, QuestionContent) {
        state.QuestionList = QuestionContent
    }

}
const actions = {
    // 通过API里面的接口函数调用，向服务器发请求，获取服务器的数据
    async QType({ commit }) {
        let result = await reqTags();
        console.log("result is", result);
        if (result.status == 200) {
            commit('QTYPELIST', result.data)
        }
    },
    async reqQuestionTags({ commit }) {
        let result = await reqQuestionTags()
        if (result.status == 200 && result.data.status != 1) {
            commit('QUESTIONTAGS', JSON.parse(result.data.tags))
        }

        // }
    },
    async addQuestion({ commit }, question) {
        // console.log("提交的问题是：", question);
        let result = await addQuestion(question);
        if (result.status == 200 && result.data.status != 1) {
            return result.data.q_id;
        } else {
            return Promise.reject(new Error(result.data.message))
        }
    },
    async reqQList({ commit }) {
        let result = await reqQList();
        if (result.status == 200) {
            commit('QuestionList', JSON.parse(result.data.questionList))
        }
    },
    async addAnswer({ commit }, answer) {
        let result = await addAnswer(answer);
        if (result.status == 200 && result.data.status != 1) {
            return result.data;
        } else {
            return Promise.reject(new Error(result.data.message))
        }
    }
}
const getters = {}
export default {
    state,
    mutations,
    actions,
    getters
}