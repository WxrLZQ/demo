<template>
    <div class="header_box">
        <div class="header_main_box">
            <div class="header_main">
                <div class="header_nav">
                    <div class="logo" @click="back_home()">
                        <img src="../../../static/images/logo.png" alt="">
                    </div>
                    <div
                        class="nav"
                        v-for="(menu,index) in menus "
                        :key="index"
                        @mousemove="over(index)"
                        @mouseout="out(index)"
                        >
                        <p>
                            <router-link :class="menu.show ?  'after_1' :'active'" :to="menu.path">{{menu.text}}</router-link>
                        </p>
                    </div>
                    <div class="search">
                        <div class="search_main">
                            <input type="text">
                            <button>
                                <i class="el-icon-search"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <!-- 用户未登录 -->
                <div class="header_login" :style=no_login >
                    <div class="login">
                        <a href="/Home/Login">登录</a>
                        <a href="/Home/Register">注册</a>
                    </div>
                </div>
                <!-- 用户登录 -->
                <div class="personal_box"  :style=is_login>
                    <div class="personal_main">
                        <div class="personal_name">{{nickname}}</div>
                        <div class="logout" @click="logout()">注销</div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            no_login:"display:block",
            is_login:"display:none",
            nickname:"",
            menus:[
                {
                    path: "/Home",
                    text: "首页",
                    show: true
                },
                {
                    path: "/Classify",
                    text: "分类",
                    show: true
                },
                {
                    path: "/Ranking",
                    text: "排行榜",
                    show: true
                },
                {
                    path: "/Contribute",
                    text: "我要投稿",
                    show: true
                }
            ]
        }
    },
    created(){
        this.getDate();
    },
    methods:{
        back_home(){
            this.$router.push({
                    name:'Home',
                    query: {
                    },
            })
        },
        getDate(){
            this.Date = JSON.parse(localStorage.getItem('Date'));
            console.log(this.Date);
            this.nickname = this.Date.nickname;
            this.isLogin = this.Date.isLogin;
            if(this.isLogin == 1){
                this.is_login ="display:block";
                this.no_login ="display:none";
            }
        },
        logout(){
            this.is_login ="display:none";
            this.no_login ="display:block";
            this.isLogin = 0;
            localStorage.removeItem('Date');
        },
        over(index) {
            this.menus[index].show = false;
        },
        out(index) {
            this.menus[index].show = true;
        },
    }
}
</script>
<style >
    .header_box{
        width:100%;
        height:4rem;
        /* border:1px solid red; */
        background-image: url("../../../static/images/background.jpg");
        background-size: 100%;
    }
    .header_main_box{
        width:100%;
        height:100%;
        /* border:1px solid red; */
        display: flex;
        align-items: center;
        justify-content: flex-end;
        background-color: rgba(253, 253, 253, 0.8);
    }
    .header_main{
        /* border:1px solid blue; */
        width:90%;
        height:100%;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .header_nav{
        width:80%;
        height:100%;
        /* border:1px solid rgb(181, 216, 52); */
        display: flex;
        align-items: center;
    }
    .active {
        color: #00b7ee;
    }
    .after_1 {
        color: black;
    }
    .nav{
        width:10%;
        height:100%;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
    }
    .nav>p>a{
        font-size:15px;
    }
    .logo{
        /* border:1px solid blue; */
        width:20%;
        height:100%;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
    }
    .logo>img{
        /* width:100%; */
        height:100%;
    }
    .search{
        width: 40%;
        height:100%;
        /* border:1px solid red; */
        display: flex;
        align-items: center;
        justify-content: flex-end;
    }
    .search_main{
        width: 80%;
        height:80%;
        /* border:1px solid red; */
        display: flex;
        align-items: center;
    }
    .search_main>input{
        border: 1px solid #00b7ee;
        border-radius: 2rem 0 0 2rem;
        border-right: none;
        width: 85%;
        height: 100%;
        padding-left: 4%;
        outline: none;
        box-sizing: border-box;
    }
    .search_main > button {
        border: 1px solid #00b7ee;
        border-radius: 0 2rem 2rem 0;
        background-color: white;
        border-left: none;
        width: 15%;
        height: 100%;
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        outline: none;
        cursor: pointer;
    }
    .el-icon-search {
        color: #00b7ee;
        font-size: 3rem;
    }
    .header_login{
        width:20%;
        height:100%;
        /* border:1px solid rgb(22, 238, 51); */
        display: flex;
        align-items: center;
    }
    .login{
        width:100%;
        height:100%;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .login>a{
        width:40%;
        height:80%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 16px;
        color: black;
    }
    .personal_box{
        width:20%;
        height:100%;
    }
    .personal_main{
        width:100%;
        height:100%;
        display: flex;
        justify-content: space-around;
    }
    .personal_main>div{
        width:40%;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .logout{
        cursor: pointer;
    }
</style>