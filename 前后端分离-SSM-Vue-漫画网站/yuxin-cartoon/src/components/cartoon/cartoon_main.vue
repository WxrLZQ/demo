<template>
    <div class="cartoon_main_box">
        <Header></Header>
        <div class="cartoon_main">
            <div class="header">
                <div class="header_mains" id="top_top">
                    <p>{{heads.text}}</p>
                    <a href="/Home">{{heads.tag}}</a>
                    <a href="#">{{this.$route.query.title}}</a>
                    <p>{{cname}}</p>
                </div>
                <div class="header_hit">
                    <span>{{this.$route.query.hit}}</span>
                </div>
            </div>

            <div class="center">
                <span>
                    <a href="#" @click="last_request()">上一话</a>
                    <p>|</p>
                    <el-button class="directory"  @click.native="drawer = true" type="primary" >目录</el-button>

                    <el-drawer
                        class="catalog_title"
                        :title=heads.title
                        :visible.sync="drawer"
                        :direction="direction"
                        >
                        <div class="catalog_box">
                            <div v-for="(catalog,index) in catalogs" :key="index">
                                <a href="#">{{catalog.num}}</a>
                                <a href="#">{{catalog.title}}</a>
                            </div>
                        </div>
                    </el-drawer>

                    <p>|</p>
                    <a href="#" @click="next_request()">下一话</a>
                </span>
                <div>
                    <img v-for="(main,index) in mains" :key="index" :src=main.pic alt="">
                </div>
                <span>
                    <a href="#" @click="last_request()">上一话</a>
                    <p>|</p>
                    <el-button class="directory" @click="drawer = true" type="primary" >目录</el-button>
                    <p>|</p>
                    <a href="#" @click="next_request()">下一话</a>
                </span>
            </div>

            <!-- <button class="top"><a href="top_top"></a> 回到顶部</button>     -->
        </div>
        <div class="footer">
                 <Recommended></Recommended>
        </div>
        <Copyright></Copyright>
    </div>
</template>
<script>
import Recommended from './recommended.vue'
import Header from "../header/header.vue"
import Copyright from "../copyright/copyright.vue"
import axios from "axios";
import qs from "qs";
export default {
    components:{
        Recommended,
        Header,
        Copyright
    },
    data(){
        return{
            height:document.body.clientHeight,
            drawer: false,
            direction: 'ltr',
            last:"0",
            next:"1",
            chapter:"",
            mid:"",
            cname:"",
            heads:{
                text:"作品",
                tag:"查看首页",
                name:"我的英雄学院",            
                title:"第2话：怒吼吧！肌肉",
                hit:"8089",
                id:"",
            },
            mains:[
            ],
            catalogs:[
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第二话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第二话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第二话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第一话",
                    title:"绿谷出久",
                },
                {
                    num:"第er话",
                    title:"绿谷出久",
                },
            ],
        }
    },
    created(){
        console.log(this.$route);
        this.getRouterDate();
        this.cartoon_create_request();
    },
    methods:{
        getRouterDate(){
            this.id = this.$route.query.id;
            this.cname = this.$route.query.name;
            console.log('id',this.id)
        },
        cartoon_create_request() {
            axios({
                method: "post",
                url: "/api/Cartoon/pic",
                data: qs.stringify({
                    // 发送数据
                    mid:this.$route.query.id
                }),
                headers: { "Content-Type": "application/x-www-form-urlencoded" }
            }).then(res => {
                // 获取数据
                console.log(res);
                this.mains = res.data;
                this.mid= this.$route.query.id
            });
        },
        last_request() {
            axios({
                method: "post",
                url: "/api/Cartoon/last",
                data: qs.stringify({
                    // 发送数据
                    last:this.last,
                    mid:this.mid,
                }),
                headers: { "Content-Type": "application/x-www-form-urlencoded" }
            }).then(res => {
                // 获取数据
                let id = res.data.chapterList.cid;
                if(id == this.mid){
                    alert("没有上一话");
                    this.mains = res.data.pictureList;
                    this.cname = res.data.chapterList.cname;
                    this.mid = res.data.chapterList.cid;
                }else{
                    this.mains = res.data.pictureList;
                    this.cname = res.data.chapterList.cname;
                    this.mid = res.data.chapterList.cid;
                }
            });
        },
        next_request() {
            axios({
                method: "post",
                url: "/api/Cartoon/next",
                data: qs.stringify({
                    // 发送数据
                    next:this.next,
                    mid:this.mid,
                }),
                headers: { "Content-Type": "application/x-www-form-urlencoded" }
            }).then(res => {
                // 获取数据
                let id = res.data.chapterList.cid;
                console.log(res.data);
                console.log(res.data.chapterList.cid);
                console.log(id);
                if(id == this.mid){
                    alert("已更新至最新话");
                    this.mains = res.data.pictureList;
                    this.cname = res.data.chapterList.cname;
                    this.mid = res.data.chapterList.cid;
                }else{
                    this.mains = res.data.pictureList;
                    this.cname = res.data.chapterList.cname;
                    this.mid = res.data.chapterList.cid;
                }
            });
        },
    },
    
}
</script>
<style>
    .cartoon_main_box{
        width:100%;
        background-color: white;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .cartoon_main{
        margin: 2%;
        width:80%;
        border:1px solid rgb(196, 194, 194);
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        overflow: hidden;
    }
    .header{
        /* border:1px solid red; */
        background-color: rgba(233, 235, 236, 0.171);
        width: 100%;
        display: flex;
        justify-content: space-between;
        font-size: 1.3rem;
        padding: 10px;
    }
    .header>div>p,.header>div>a{
        padding-right: 1.2rem;
    }
    .header_mains{
        display: flex;
    }
    .header_mains>a{
        color: rgb(252, 63, 63);
    }
    .header_hit{
        margin-right: 5%;
    }

/* ************目录************* */
    .el-button--primary{
        background: none !important;
        border: none !important;
        color: black ;
    }
    .el-button{
        padding: 0px;
    }
    tr:hover{
        color: black !important;
    }
    .catalog_box{
        /* border:1px solid red; */
        height:700px;
        overflow: scroll;
    }
    .catalog_box>div{
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.3rem;
        margin: 6%;
    }
    element.style{
        width:15% ;
    }
    el-drawer__header>span{
        font-size: 1.5rem;
    }
/* ***************************** */
    .center{
        display: flex;
        align-items: center;
        flex-direction: column;
    }
    .center>span{
        display: flex;
        justify-content: space-between;
        width: 20%;
        font-size: 1.2rem;
        color: black;
        padding: 3%;
    }
    .center>span>a{
        color: black;
        width:5rem;
    }
    .center>div{
        display: flex;
        flex-direction: column;
        width: 50%;
        align-items: center;
        /* border:1px solid red; */
    }
    .center>div>img{
        width: 100%;
    }
    .footer{
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .top{
        position: fixed;
        right: 11%;
        bottom: 4%;
    }
</style>