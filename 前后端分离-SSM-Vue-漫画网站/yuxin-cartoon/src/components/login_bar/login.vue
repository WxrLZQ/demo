<template>
    <div class="login_box">
        <div class="login">
            <div class="logo" >
                <div>{{name}}</div>
            </div>
            <div class="main_box" >
                <div class="form">
                    <div class="main" >
                        <div>{{mains[0].text_1}}</div>
                        <input type="text" :placeholder="mains[0].text_2" v-model="username">
                    </div>
                    <div class="main">
                        <div>{{mains[1].text_1}}</div>
                        <input type="password" :placeholder="mains[1].text_2"  v-model="password">
                    </div>
                    <!-- <p> 
                        <span>
                            <input type="checkbox" checked="checked" >
                            <label for="">记住我</label>
                        </span>
                         <a href="#">忘记密码？</a>
                    </p> -->
                    <div class="submit_box">
                        <div class="submit">
                            <a @click="login()">
                                <div>登录</div>
                            </a>
                        </div>
                    </div>
                    
                    <p>
                        <span>还没有账号？</span>
                        <a href="/Home">返回首页</a>
                        <a href="/Home/Register">立即注册</a>
                    </p>
                </div>
            </div>
        </div>
        <!-- 注册模块
        1.用户输入用户名及密码，调用接口
            1.1注册成功直接跳转登录页
        
        登录模块
        1.用户输入用户名及密码，调用接口
            1.1用户名未找到，提示用户：“用户名不存在”
            1.2用户名找到，但密码错误，提示用户：“密码输入错误”
            1.3用户名和密码都匹配，登录成功跳转主页，同时将用户名存为cookie
        2.加载主页获取cookie
            2.1cookie存在，显示用户名 -->
            
    </div>
</template>
<script>
import axios from "axios";
import qs from "qs";
export default {
    data(){
        return{
            img:"LOGO",
            name:"余心漫画",
            type:"text",
            username:"",
            password:"",
            nickname:"",
            Date:"",
            isLogin:"",
            log:"1",
            mains:[
                {
                    text_1:"账号:",
                    text_2:"请输入邮箱地址",
                },
                {
                    text_1:"密码:",
                    text_2:"请输入密码",
                },
            ]
        }
    },
    created(){
        // this.getRouterDate();
        // this.getDate();
    },
    methods:{
        login() {
            axios({
                method: "post",
                url: "/api/User/login",
                data: qs.stringify({
                    email: this.username,
                    password: this.password,
                }),
                headers: { "Content-Type": "application/x-www-form-urlencoded" }
            }).then(res => {
                console.log(res.data);
                this.isLogin = res.data;
                if(this.isLogin == 1){
                    alert("账号或密码错误");
                }else{
                     
                    this.Date={
                        nickname: this.isLogin.nickname,
                        isLogin:this.log,
                    };
                    localStorage.setItem('Date',JSON.stringify(this.Date));
                    this.$router.push({
                        name:'Home',
                        query: {
                            nickname: this.nickname,
                        },
                    })
                }
            });
        },
    }
}
</script>
<style >
    .login_box{
        width:100%;
        height:700px;
        background-image: url("../../../static/images/login.jpg");
        background-attachment: fixed;
        background-size: 100%;
        background-repeat: no-repeat;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .login{
        width:30rem;
        height:25rem;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        /* border:1px solid rgba(250, 243, 243, 0.2); */
        border-radius: 2rem;
        background-color: rgb(226, 225, 225,0.1);
    }
    .logo{
        width:100%;
        height:10%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 5%;
        /* border:1px solid red; */
    }
    .logo>div{
        width:20rem;
        font-size: 2rem;
        /* border:1px solid red; */
        color: rgb(248, 245, 248);
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .main_box{
        width:100%;
        height:88%;
        border-radius: 10px;
        background-color:rgba(107, 105, 105, 0);
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .form{
        width:90%;
        height:80%;
        /* border:1px solid black; */
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content:space-between;
        margin-top: 4%;
    }
    .form>div{
        /* border-bottom:1px solid rgb(241, 240, 240); */
        width:80%;
        height:15%;
        color: white;
    }
    .main{
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .main>div{
        font-size: 1.6rem;
        width: 20%;
        color: white;
    }
    .main>input{
        width:78%;
        height:70%;
        border: none;
        background-color:rgba(107, 105, 105, 0);
        color:rgb(49, 48, 48);
        outline: none;
    }
    input::-webkit-input-placeholder {
        color: white;
    }
    .form>p{
        color: white;
        /* border:1px solid rgb(131, 128, 103); */
        width:80%;
        height:15%;
        display: flex;
        align-items: center;
        justify-content: space-between;
        font-size: 1.3rem;
    }
    .form>p>a{
        font-size: 1.1rem;
        color: rgb(238, 253, 18);
    }
    .submit_box{
        /* border:1px solid rgb(241, 148, 120); */
        width:100%;
        height:30%;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .submit{
        /* border:1px solid rgb(243, 68, 15); */
        width:100%;
        height:100%;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .submit>a{
        /* border:1px solid rgb(243, 68, 15); */
        width:100%;
        cursor: pointer;
        height:100%;
        border-radius: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: rgb(220, 223, 60);
    }
    .submit>a>div{
        font-size: 1.4rem;
        color: rgb(19, 10, 15);
    }
</style>