<template>
    <div class="catalogue_box">
        <Header></Header>
        <div class="catalogue_main">
            <div class="introduction">
                <div class="cartoon_img" :style="{'backgroundImage':'url('+this.$route.query.img+')','background-size':'100%'}"></div>
                <div class="cartoon_text">
                    <span class="cartoon_title">{{this.$route.query.title}}</span>
                    <p  class="cartoon_author">{{this.$route.query.author}}</p>
                    <span  class="cartoon_bref">{{heads.bref}}</span>
                    <p>{{this.$route.query.text}}</p>
                    <div>
                        <div>
                            <a href="#" >{{heads.button_1}}</a>
                            <a href="#" >{{heads.button_2}}</a>
                        </div>
                        
                        <P>
                            <a href="javascript:;">{{heads.tag_1}}</a>
                            <a href="javascript:;">{{heads.tag_2}}</a>
                        </P>
                    </div>
                </div>
            </div>
            <div class="directory">
                <div class="cartoon_mains" v-for="(main,index) in mains" :key="index">
                    <div>
                        <router-link :to="{name:'Cartoon_main',query:{name:main.cname,title:main.title,hit:main.hit,id:main.cid}}"><img :src=main.img alt=""></router-link>
                    </div>
                    <router-link :to="{name:'Cartoon_main',query:{name:main.cname,title:main.title,id:main.cid}}">{{main.cname}}</router-link>
                    <p>{{main.hit}}</p>
                    <span>{{main.date}}</span>
                </div>
            </div>
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
            text:"同类推荐",
            heads:{
                img:"",
                title:"",
                author:"",
                bref:"漫画简介",
                text:"",
                button_1:"查看第一话",
                button_2:"关注",
                tag_1:"1.03亿",
                tag_2:"90万",
            },
            mains:[
            ],
            footers:[
                {
                    img:"../../../static/images/comment_1.jpg",
                    title:"大龟甲师",
                    hit:"65万",
                    comment:"1.5万"
                },
                {
                    img:"../../../static/images/comment_2.jpg",
                    title:"大龟甲师",
                    hit:"65万",
                    comment:"1.5万"
                },
                {
                    img:"../../../static/images/comment_3.jpg",
                    title:"大龟甲师",
                    hit:"65万",
                    comment:"1.5万"
                },
                {
                    img:"../../../static/images/comment_4.jpg",
                    title:"大龟甲师",
                    hit:"65万",
                    comment:"1.5万"
                },
                {
                    img:"../../../static/images/comment_5.jpg",
                    title:"大龟甲师",
                    hit:"65万",
                    comment:"1.5万"
                },
            ]
        }
    },
    methods:{
        // 创建页面请求
        catalogue_create_request() {
            axios({
                method: "post",
                url: "/api/Cartoon/chapter",
                data: qs.stringify({
                    // 发送数据
                    cid:this.$route.query.id
                }),
                headers: { "Content-Type": "application/x-www-form-urlencoded" }
            }).then(res => {
                // 获取数据
                console.log(res);
                this.mains = res.data;
            });
        },
    },
    created(){
        this.catalogue_create_request();
    }
}
</script>
<style>
    .catalogue_box{
        width:100%;
        background-color: white;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    .catalogue_main{
        width:80%;
        border:1px solid rgb(88, 87, 87,0.5);
        border-radius: 10px;
        margin: 2%;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .introduction{
        width:100%;
        border-bottom:1px solid rgb(88, 87, 87,0.5);
        /* border-radius: 10px; */
        display: flex;
        align-items: center;
        
    }
    .cartoon_img{
        width:30%;
        height:18rem;
        /* border:1px solid red; */
        border-radius: 10px;
        margin: 30px;
    }
    .cartoon_text{
        width:60%;
        height:18rem;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        /* border:1px solid red; */
    }
    .cartoon_title{
        font-size: 2.5rem;
        /* margin-bottom: 1rem; */
    }
    .cartoon_author{
        color: rgb(153, 154, 155);
        margin-bottom: 1rem;
    }
    .cartoon_bref{
        width:10%;
        height:12%;
        border-bottom: 2px solid rgb(245, 209, 5);
        display: flex;
        align-items: center;
        font-size: 1.2rem;
        margin-bottom: 2%;
    }
    .cartoon_text>p{
        margin-bottom: 2%;
        color: rgb(139, 139, 139);
    }
    .cartoon_text>div{
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .cartoon_text>div>div{
        display: flex;
        /* border:1px solid red; */
        width:15rem;
        justify-content: space-between;
        
    }
    .cartoon_text>div>div>a{
        width:6rem;
        height:2rem;
        background-color: rgb(250, 230, 51);
        border-radius: 5px;
        color: rgb(114, 114, 114);
        display: flex;
        align-items: center;
        justify-content: center;
    }
     .cartoon_text>div>P{
        /* border:1px solid red; */
        display: flex;
        justify-content: space-between;
        width: 20%;
     }
     .cartoon_text>div>P>a{
        display: block;
        color: black;
     }
     .directory{
        /* border:1px solid red; */
        width:90%;

     }
     .cartoon_mains{
        width:100%;
        display: flex;
        align-items: center;
        justify-content: space-between;
        border-bottom: 1px solid rgb(216, 215, 215);
        padding-bottom: 2%;
        padding-top: 2%;
     }
     .cartoon_mains>div{
         border:1px solid red;
         border-radius: 10px;
         width:20%;
         height:9rem;
         overflow: hidden;
     }
     .cartoon_mains>div>a>img{
         width: 100%;
     }
     .cartoon_mains>a{
         color: black;
     }
     .footer{
         display: flex;
         align-items: center;
         justify-content: center;
     }
</style>