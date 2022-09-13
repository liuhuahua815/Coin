### 设计初衷
* 因为自己大学以来一直是学委，每到期末周总是有很多同学会问复习资料、需要交流课程题目，所以就产生了写一个这种网站的想法吧。在这里同学们可以上传下载学习资料、互相回答对方的问题、记录课堂笔记……
### 设计过程
+ **period1**  
  + 前端语言：原生 html + css + js + jquery  
  +  后端语言：php 
  +  前后端不分离
>刚开始还不会框架用的是原生的js写的代码，十分痛苦。所有样式都自己写（没用组件库），什么动态展示添加的数据（用字符串拼接再document.innerHtml展示或者createElment...)...动态为添加的dom绑定事件...一个数据多个页面要用到怎么传参啊...想想不用框架写这些真的挺麻烦的，但也挺感激这段经历的，让我对框架的理解更深刻了，也让我的css、js基础更扎实了。
+ **period2**  
  + 前端框架: Vue + vuex + vue-Router + Element-UI
  + 后端语言：node.js
  + 前后端分离
>后来目标确定搞前端了，就chuaichuai把vue学完了，重构了这个项目。开始用组件库的时候，哇那叫一个爽得起飞，第一次感觉自己写页面也能这么快。
### 系统功能
主要分成图中框起来的这五大模块，没重构前是全部写完了，重构后笔记区和管理员这两模块还没写完
![image](https://user-images.githubusercontent.com/65109877/189949746-8dfff4fa-be00-4885-8725-8ccb451782ba.png)
### 部分页面截图（重构后的）
####  1. 用户注册
![67e567b1904fc8d2012a5ddb39b24a4](https://user-images.githubusercontent.com/65109877/189950861-65e766de-063f-4d65-92d1-8d78b0806062.png)
#### 2. 期末急救箱
 +  a. 主页面
  ![5e19a2d85a8cb036bff69ddfde1a746](https://user-images.githubusercontent.com/65109877/189950889-972277bf-19fc-45f8-85d6-3d04ffa2d083.png)
 +  b. 上传
  ![e0a248f51ce34f87acca771f940759a](https://user-images.githubusercontent.com/65109877/189950927-76652bf9-eb07-48ed-956d-8614af52b30b.png)
![aefe4725975fc4c955bcc34ef065875](https://user-images.githubusercontent.com/65109877/189950956-cbf7208b-bc53-44dd-b9b6-7247e0995b55.png)
 + c. 文件预览
  ![f3e86178709a7ee094eb09e4782a655](https://user-images.githubusercontent.com/65109877/189951025-ba0eaa6e-47d0-4821-99b1-d8accbdd4671.png)
![ebad14f26a85efe1fcc457309f78c58](https://user-images.githubusercontent.com/65109877/189951050-b6ba1c20-26b5-467c-ab15-2bf8d25434cf.png)
#### 3. 答疑区 
+ a. 问题中心
![bd916cb24d1254953ae4322a0a94867](https://user-images.githubusercontent.com/65109877/189951877-894798bc-9492-4198-bc96-25e4186b3b28.png)
+ b. 具体问题
![cf3eff57a6dc1cb64d7764d900e73bd](https://user-images.githubusercontent.com/65109877/189951941-bf25f349-3988-4d9d-9ccd-9cbd80a350f3.png)
+ d. 问题发布
![ca9b296b6bd2ff15cfcf04b527ad80e](https://user-images.githubusercontent.com/65109877/189951988-9c8ab96b-0271-47f7-b13d-daa6b6c541cb.png)
+ e. markdown编辑器
  ![8c6c192a1417183dc32b86bd8d98b6a](https://user-images.githubusercontent.com/65109877/189954767-b16513e2-f048-4af3-9bad-09a57a0c096a.png)
![38b461b50352b603726651e23ec51b8](https://user-images.githubusercontent.com/65109877/189954790-1746c371-e85e-4227-a354-64666bed50b3.png)
#### 4. 个人中心
![1e643cc09a2020d518fb920f625c931](https://user-images.githubusercontent.com/65109877/189952100-39fde2a0-709c-4ac7-a41d-bbd6ac7b5b0a.png)
### 使用
+ 启动（原生版本）
  xxxx以后补充
+ 启动（重构后的版本）
  + 前端部分 npm run serve
  + 后端部分 node app.js
