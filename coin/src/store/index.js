import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)
// 引入小仓库
import blog from './blog';
import search from './search'
import Question from './Question';
import user from './user'

// getters理解为计算属性，用于简化仓库数据，让组件获取仓库的数据更加方便
const getters = {}
export default new Vuex.Store({
    //    实现Vuex仓库模块式开发存储数据
    modules: {
        blog,
        search,
        Question,
        user
    }
}
)