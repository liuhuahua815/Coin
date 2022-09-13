import Vue from 'vue'
import App from './App.vue'
import { Loading, Message, Input, Select, Option, Checkbox, Radio, Switch, Button, Row, Container, Main, Header, Aside, Icon, Alert, MessageBox, Form, FormItem, Dialog } from 'element-ui';
import { Tabs, TabPane } from 'element-ui';
// menu-item-group 期末急救箱
import { Menu, Submenu, MenuItem, MenuItemGroup, Table, TableColumn, Progress } from 'element-ui';

import router from '@/router'
import store from '@/store'
import * as API from "@/api"
import MyIcon from '@/components/MyIcon'
/* import { reqTags } from '@/api'
console.log("res is", reqTags()); */
import '@/assets/svg/iconfont.js'
Vue.config.productionTip = false

Vue.component("MyIcon", MyIcon)
Vue.use(Input)
Vue.use(Checkbox)
Vue.use(Select)
Vue.use(Radio)
Vue.use(Option)
Vue.use(Switch)
Vue.use(Button);
Vue.use(Row);
Vue.use(Container)
Vue.use(Main)
Vue.use(Header)
Vue.use(Aside)
Vue.use(Icon)
Vue.use(Alert)
Vue.use(Form)
Vue.use(FormItem)

//个人中心页使用组件如下
Vue.use(Tabs)
Vue.use(TabPane)
// Vue.use(MessageBox)
//期末急救箱
Vue.use(MenuItemGroup)
Vue.use(Menu)
Vue.use(Submenu)
Vue.use(MenuItem)
Vue.use(Table)
Vue.use(TableColumn)
Vue.use(Dialog)
Vue.use(Progress)

Vue.use(Loading)
Vue.prototype.$MessageBox = MessageBox
Vue.prototype.$message = Message

new Vue({
    router,
    store,
    render: h => h(App),
    beforeCreate() {
        Vue.prototype.$API = API;
        Vue.prototype.$bus = this
    }
}).$mount('#app')
