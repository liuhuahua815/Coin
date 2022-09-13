import { reqUserRegister, reqUserLogin, updateAvatar, updateUserInfo } from "@/api"
import { getStorage, setStorage, removeStorage } from '@/utils/storage'
//user模块的小仓库
const state = {
    user: {},
    token: ""
}
const mutations = {
    SET_USER(state, user) {
        state.user = user
    },
    SET_TOKEN(state, token) {
        state.token = token
    },
    SET_USER_BY_KEY(state, [key, value]) {
        state.user[key] = value
    }
}


const actions = {
    async userRegister({ commit }, user) {
        // console.log("注册的用户是：", user);
        let result = await reqUserRegister(user);
        // console.log("注册的结果是", result);
        if (result.status == 200 && result.data.status != 1) {
            return '用户注册成功'
        } else {
            return Promise.reject(new Error(result.data.message))
        }
    },
    async userLogin({ commit }, user) {
        // console.log("登录的用户是：", user);
        let result = await reqUserLogin(user);
        // console.log("登录的结果是", result);
        if (result.status == 200 && result.data.status != 1) {
            const data = result.data.data
            // 数据持久化存储
            setStorage('user', data.user)
            setStorage('TOKEN', data.token)
            // 更新仓库中的数据
            commit('SET_USER', data.user)
            commit('SET_TOKEN', data.token)

            return {
                message: '用户登录成功',
                imgPath: data.user.img_path
            }
        } else {
            // console.log("result in user store is", result);
            return Promise.reject(new Error(result.data.message))
        }
    },
    async updateAvatar({ commit }, formData) {
        var result = await updateAvatar(formData);
        if (result.status == 200 && result.data.status != 1) {
            var url = result.data.filename;
            console.log("头像为", url);
            commit('SET_USER_BY_KEY', ['img_path', url])
            return url
        } else {
            return Promise.reject(new Error(result.data.message))
        }
    },
    async updateUserInfo({ commit }, [key, value]) {
        let obj = {}
        obj[key] = value
        console.log('obj is', obj);
        var result = await updateUserInfo(obj);
        if (result.status == 200 && result.data.status != 1) {
            commit('SET_USER_BY_KEY', [key, value])
            return '信息修改成功'
        } else {
            console.log('抛出错误', result.data.message);
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