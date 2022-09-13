import Vue from 'vue'
import VueRouter from 'vue-router'
import store from '@/store'
// 引入自定义组件
import PostNote from '../views/Note/PostNote'
import NotebookList from '../views/Note/NotebookList'
import NoteType from '../views/Note/NoteType'
import Notebook from '../views/Note/Notebook'
import PostQ from '../views/QA/PostQ'
import QAList from '../views/QA/QAList'
import Question from '../views/QA/Question'
import Solution from '../views/QA/Solution'
import UserCenter from '../views/UserCenter'
import Home from '../views/Home.vue'
import Search from '../views/Search'
import RegLogin from '../views/User/RegLogin'
import ResourceBox from '@/views/ResourceBox'

import { Message } from 'element-ui';
Vue.use(VueRouter)

const router = new VueRouter({
    routes: [
        {
            path: '/',
            component: Home,
            meta: { showNav: true }
        },
        {
            path: '/regLogin',
            component: RegLogin,
            meta: { showNav: false }

        },
        {
            name: 'search',
            path: '/search/:searchContent?',
            component: Search,
            meta: { showNav: true }
        },
        {
            path: '/PostNote',
            component: PostNote,
            meta: { showNav: false }
        },
        {
            path: '/Resource',
            component: ResourceBox,
            meta: { showNav: true }
        },
        {
            path: '/NotebookList',
            component: NotebookList,
            meta: { showNav: true },
            children: [
                {
                    path: 'NoteType',
                    component: NoteType,
                    children: [
                        {
                            path: 'Notebook',
                            component: Notebook
                        }
                    ]
                }
            ]
        },
        {
            path: '/PostQ',
            component: PostQ,
            meta: { showNav: true }
        },
        {
            path: '/QAList',
            component: QAList,
            meta: { showNav: true },
        },
        {
            name: "QAndA",
            path: '/Questions',
            component: Question,
            meta: { showNav: true },
            children: [
                {
                    path: 'Solution',
                    component: Solution
                }
            ]
        },
        {
            path: '/UserCenter',
            component: UserCenter,
            meta: { showNav: true }
        }
    ]
})
router.beforeEach((to, from, next) => {
    let token = store.state.user.token
    if (token) {
        if (to.path == '/regLogin') {
            console.log('用户想要跳转至regLogin');
            next('/Resource')
        } else {
            next()
        }
        // next()
    } else {
        let toPath = to.path
        console.log('path is', toPath);
        let userLimitedPath = ['/PostQ', '/PostNote']
        if (userLimitedPath.includes(toPath)) {
            Message({
                message: '请先登录',
                duration: 2000,
                type: 'warning'
            })
            next('/regLogin?redirect=' + toPath);
        } else {
            next()
        }

    }
})
export default router
