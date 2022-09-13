import axios from "axios";
import store from '@/store'
import nprogress from "nprogress";
import "nprogress/nprogress.css"
const requests = axios.create({
    timeout: 10000
})
// 请求拦截器
requests.interceptors.request.use((config) => {
    //用户身份token
    if (store.state.user.token) {
        config.headers.Authorization = store.state.user.token;
    }
    return config
},
    (error) => {
        console.log('error is', error);
        Promise.reject(error)
    }
)
// 响应拦截器
requests.interceptors.response.use((res) => {
    console.log("请求到的数据是", res);
    return res
}, (error) => {
    console.log('error is', error);
    Promise.reject(error)
})
export default requests