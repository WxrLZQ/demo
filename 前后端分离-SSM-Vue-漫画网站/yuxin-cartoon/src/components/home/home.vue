<template>
    <div class="home_box">
        <Header></Header>
        <!-- 轮播图 -->
        <div class="LBT_main">
            <el-carousel class="LBT_main_box" direction="vertical" :autoplay="true">
                <el-carousel-item v-for="(item,index) in LBT_photo" :key="index">
                    <a href="#"><img class="recommend_center_img" v-bind:src=item.url alt=""> </a> 
                </el-carousel-item>
            </el-carousel>
        </div>

        <!-- 推荐 -->
        <div class="recommend_box">
            <div class="recommend_left">
                <div class="left_header">
                    <div class="left_nav_null"></div>
                    <div 
                        class="left_nav"
                        v-for="(nav,index) in navs_1 "
                        :key="index"

                        >
                        <p  @mousemove="over_1(index)"
                            @mouseout="out_1(index)" 
                            :class="nav.show ?  'before' :'after'">
                            {{nav.text}}
                        </p>
                    </div>
                </div>
                <div class="left_center">
                    <router-link class="recommend_main" v-for="(list,index) in cartoon_list" :key="index"
                     :to="{name:'Catalogue',
                     query:{title:list.title,img:list.img,author:list.author,text:list.text,id:list.cid}}" >
                        <div class="main_photo_box">
                            <div class="main_photo">
                                <img class="main_photo_img" v-bind:src=list.img alt="">
                                <p>{{list.update}}</p>
                            </div>
                        </div>
                        <div class="main_title">
                            <p>{{list.title}}</p>
                        </div>
                        <div class="main_text">
                            <p>{{list.author}}</p>
                            <div>
                                <i class="el-icon-thumb"></i>
                                <p>99万+</p>
                            </div>
                        </div>
                    </router-link>
                </div>
            </div>
            <div class="recommend_right">
                <div class="right_header">
                    <p>排行</p>
                </div>

                <div class="right_center" >
                    <router-link class="ranking_box"
                        v-for="(ranking,index) in rankings" :key="index" 
                        @mousemove.native="ranking_over(index)"
                        @mouseout.native="ranking_out(index)"
                        :to="{name:'Catalogue',
                        query:{title:ranking.title,img:ranking.img,author:ranking.author,text:ranking.text,id:ranking.cid}}"
                        >

                        <div class="ranking_num">
                            <p>{{index+1}}</p>
                        </div>
                        <!-- 移入 -->
                        <a class="ranking_main_box" :ref="'ranking_1'+index" style="display:block" href="">
                            <div class="ranking_main">
                                <div class="ranking_title">
                                    <p>{{ranking.title}}</p>
                                    <div>
                                        <i class="el-icon-thumb"></i>
                                        <p>99万+</p>
                                    </div>
                                </div>
                                <div class="ranking_text">{{ranking.text}}</div>
                            </div>
                        </a>
                        <!-- 移出 -->
                        <a class="after_ranking_main_box" :ref="'ranking_2'+index" style="display:none" href="">
                            <div class="after_ranking_main">
                                <div class="after_ranking_photo">
                                    <div>
                                        <img v-bind:src=ranking.img alt="">
                                    </div>
                                </div>
                                <div class="after_ranking_center">
                                    <div class="after_ranking_title">
                                        <p>{{ranking.title}}</p>
                                    </div>
                                    <div class="after_ranking_text">
                                        <p>{{ranking.text}}</p>
                                    </div>
                                    <div class="after_ranking_hit">
                                        <div>
                                            <i class="el-icon-thumb"></i>
                                            <p>99万+</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>

                    </router-link>
   
                </div>

            </div>
        </div>

        <!-- 榜单 -->
        <div class="recommend_2_box">
            <div class="recommend_left">
                <div class="left_header">
                    <div class="left_nav_null"></div>
                    <div 
                        class="left_nav"
                        v-for="(nav,index) in navs_2 "
                        :key="index"

                        >
                        <p  @mousemove="over_2(index)"
                            @mouseout="out_2(index)" 
                            :class="nav.show ?  'before_2' :'after_2'">
                            {{nav.text}}
                        </p>
                    </div>
                </div>
                <div class="left_center_2">
                    <router-link class="recommend_main" v-for="(list,index) in ranking_list" :key="index" 
                        :to="{name:'Catalogue',
                        query:{title:list.title,img:list.img,author:list.author,text:list.text,id:list.cid}}">
                        <div class="main_photo_box">
                            <div class="main_photo">
                                <img class="main_photo_img" v-bind:src=list.img  alt="">
                                <p>{{list.update}}</p>
                            </div>
                        </div>
                        <div class="main_title">
                            <p>{{list.title}}</p>
                        </div>
                        <div class="main_text">
                            <p>{{list.author}}</p>
                            <div>
                                <i class="el-icon-thumb"></i>
                                <p>99万+</p>
                            </div>
                        </div>
                    </router-link>
                </div>
            </div>
            <div class="ranking_right">
                <div class="advertisement_box"></div>
            </div>
        </div>

        <!-- 新作推荐 -->
        <div class="news_box">
            <div class="news_main_box">
                <div class="news_left">
                    <div class="news_left_header">
                        <p>新书推荐</p>
                    </div>
                    <div class="news_left_center">
                        <router-link class="news_main" v-for="(news,index) in cartoon_news" :key="index" 
                            :to="{name:'Catalogue',
                            query:{title:news.title,img:news.url,author:news.author,text:news.text,id:news.cid}}">
                            <div class="left_center_photo">
                                <img :src=news.img alt="">
                                <div class="left_center_text_box">
                                    <div class="left_center_text">
                                        <p>{{news.title}}</p>
                                        <p>{{news.author}}</p>
                                        <div class="news_text">{{news.text}}</div>
                                    </div>
                                </div>
                            </div>
                            
                        </router-link>
                        
                    </div>
                </div>
                <div class="news_right"></div>
            </div>
        </div>

        <!-- 版权模块 -->
        <Copyright></Copyright>
    </div>
</template>
<script>
import Header from "../header/header.vue"
import Copyright from "../copyright/copyright.vue"
import axios from "axios";
import qs from "qs";
export default {
    components:{
        Header,
        Copyright,
    },
    data(){
        return{
           LBT_photo:[
                    { url:"../../../static/images/LBT1.jpg"},
                    { url:"../../../static/images/LBT2.jpg"},
                    { url:"../../../static/images/LBT3.jpg"},
                    { url:"../../../static/images/LBT4.jpg"},
                    { url:"../../../static/images/LBT5.jpg"},
            ],
            navs_1:[
                {
                    text:"首页推荐",
                    show:false,
                    recid:"1",
                },
                {
                    text:"最近更新",
                    show:true,
                    recid:"2",
                },
                {
                    text:"猜你喜欢",
                    show:true,
                    recid:"3",
                },
                
            ],
            navs_2:[
                {
                    text:"综合榜单",
                    show:false,
                    recid:"4",
                },
                {
                    text:"口碑榜",
                    show:true,
                    recid:"5",
                },
                {
                    text:"畅销榜",
                    show:true,
                    recid:"6",
                },
                
            ],
            cartoon_list:[
            ],
            rankings:[
            ],
            ranking_list:[
            ],
            cartoon_news:[
            ]
        }
    },
    created(){
        // this.ranking();
        this.create_request();
    },
    methods:{
        // 推荐模块逻辑
        over_1(index) {
            this.navs_1[index].show = false;
            this.recomment_request(index);
        },
        out_1(index) {
            this.navs_1[index].show = true;
        },
        ranking_over(index) {
            let ref_1='ranking_1'+index;
            let ref_2='ranking_2'+index;
            console.log(ref_1);
            this.$refs[ref_1][0].style.display= 'none';
            this.$refs[ref_2][0].style.display= 'block';
        },
        ranking_out(index) {
            let ref_1='ranking_1'+index;
            let ref_2='ranking_2'+index;
            this.$refs[ref_1][0].style.display= 'block';
            this.$refs[ref_2][0].style.display= 'none';
        },
        // ranking(index){
        //     let ref_1='ranking_1'+index;
        //     let ref_2='ranking_2'+index;
        //     if(ref_1 == "ranking_10" && ref_1 == "ranking_10"){
        //         console.log("测试");
        //     }
        //     this.$refs[ref_1][0].style.display= 'block';
        //     this.$refs[ref_2][0].style.display= 'none';
        // },

        // 榜单模块逻辑
        over_2(index) {
            this.navs_2[index].show = false;
            this.ranking_request(index);
        },
        out_2(index) {
            this.navs_2[index].show = true;
        },

        // 创建页面请求
        create_request() {
            axios({
                method: "post",
                url: "/api/Cartoon/homepage",
                data: qs.stringify({
                    // 发送数据
                }),
                headers: { "Content-Type": "application/x-www-form-urlencoded" }
            }).then(res => {
                // 获取数据
                console.log(res);
                this.cartoon_list=res.data.recommed;
                this.rankings=res.data.T_Ranking;
                this.ranking_list=res.data.billboard;
                this.cartoon_news=res.data.B_Ranking;
            });
        },
        // 推荐模块请求
        recomment_request(index) {
            axios({
                method: "post",
                url: "/api/Cartoon/choice",
                data: qs.stringify({
                    // 发送数据
                    recid:this.navs_1[index].recid
                }),
                headers: { "Content-Type": "application/x-www-form-urlencoded" }
            }).then(res => {
                // 获取数据
                console.log(res);
                this.cartoon_list = res.data;
            });
        },
        // 排行版模块请求
        ranking_request(index) {
            axios({
                method: "post",
                url: "/api/Cartoon/choice",
                data: qs.stringify({
                    // 发送数据
                    recid:this.navs_2[index].recid
                }),
                headers: { "Content-Type": "application/x-www-form-urlencoded" }
            }).then(res => {
                // 获取数据
                console.log(res);
                this.ranking_list = res.data;
            });
        },
        
    }
}
</script>
<style >
    .home_box{
        width:100%;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
/* ***轮播图模块***     */
    .LBT_main{
        margin-bottom: 1%;
        width:100%;
        height:29rem;
        /* border:1px solid red; */
    }
    .el-carousel__item h3 {
        color: #475669;
        font-size: 14px;
        opacity: 0.75;
        line-height: 200px;
        margin: 0;
    }
    .el-carousel__container{
        height:100%;
    }
    .el-carousel__item:nth-child(2n) {
        background-color: #99a9bf;
    }
    
    .el-carousel__item:nth-child(2n+1) {
        background-color: #d3dce6;
    }
    .LBT_main_box{
        width:100%;
        height:100%;
    }
    .recommend_center_img{
        width:100%;
        /* height:100%; */
    }
/* 推荐模块 */
    .recommend_box{
        /* border:1px solid red; */
        width:80%;
        height:45rem;
        display: flex;
        justify-content: space-between;
    }
    .recommend_left{
        width:70%;
        height:100%;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .left_header{
        /* border:1px solid red; */
        width:100%;
        height:8%;
        display: flex;
    }
    .left_nav{
        width:10rem;
        height:100%;
        /* border:1px solid red; */
        display: flex;
        align-items: flex-end;
        justify-content: center;
    }
    .left_nav>p{
        width:95%;
        height:70%;
        /* border:1px solid red; */
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
    }
    .before{
        width:95%;
        height:70%;
        /* border:1px solid red; */
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
    }
    .after{
        width:95%;
        height:70%;
        border: 2px solid #00b7ee;
        border-radius:  1.2rem 1.2rem 0 0 ;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        font-size: 16px;
        color: #00b7ee;
    }
    .left_nav_null{
        width:6%;
        height:100%;
        /* border:1px solid red; */
    }
    .left_center{
        border: 2px solid #00b7ee;
        border-radius:  1rem ;
        width:100%;
        display: flex;
        align-items: center;
        justify-content: space-around;
        flex-wrap: wrap;
        overflow: hidden;
    }
    
/* 漫画列表模块 */
    .recommend_main{
        /* border:1px solid red; */
        width:13rem;
        height:18rem;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;
        margin-top: 2%;
        margin-bottom: 2%;
    }
    .main_photo_box{
        width:96%;
        height:80%;
        border:1px solid rgb(63, 63, 63);
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .main_photo{
        width:96%;
        height:96%;
        /* border:1px solid rgb(63, 63, 63); */
        overflow: hidden;
        position: relative;
    }
    .main_photo>p{
        position: absolute;
        bottom: 2px;
        right: 3px;
        color: rgba(255, 255, 255, 0.932);
        background-color: rgb(12, 12, 12,0.3);
        font-size: 6px;
        padding: 2px;

    }
    .main_photo_img{
        width:100%;
    }
    .main_title{
        width:96%;
        height:10%;
        /* border:1px solid rgb(63, 63, 63); */
        display: flex;
        align-items: center;
        color: black;
        font-weight: bold;
    }
    .main_title>p{
        font-size: 13px;
    }
    .main_text{
        width:96%;
        height:10%;
        /* border:1px solid rgb(63, 63, 63); */
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: rgb(109, 107, 107);
    }
    .main_text>div{
        display: flex;
        align-items: center;
    }
/* 排行榜模块 */
    .recommend_right{
        /* border:1px solid blue; */
        width:28%;
        height:100%;
        display: flex;
        flex-direction: column;
    }
    .right_header{
        width:100%;
        height:8%;
        /* border:1px solid red; */
        display: flex;
        flex-direction: column;
        justify-content: center;
    }
    .right_header>p{
        font-size: 16px;
        font-weight: 600;
        color: rgb(49, 49, 49);
    }
    .right_center{
        width:100%;
        height:92%;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        overflow: hidden;
    }
    .ranking_box{
        width:100%;
        /* border:1px solid red; */
        display: flex;
    }
    .ranking_num{
        display: flex;
        align-items: flex-start;
        justify-content: center;
        width:13%;
        height:100%;
        /* border:1px solid red; */
    }
    .ranking_num>p{
        width:27px;
        height:27px;
        font-size: 18px;
        background-color: #34c6f3da;
        border-radius:  0.4rem ;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
    }
    .ranking_main{
        width:100%;
        height:100%;
        /* border:1px solid red; */
        display: flex;
        flex-direction: column;
    }
    .ranking_main_box{
        width:87%;
        height:5.5rem;
        /* border:1px solid red; */
    }
    .ranking_title{
        width:100%;
        height:50%;
        /* border:1px solid blue; */
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .ranking_title>p{
        width:80%;
        height:100%;
        display: flex;
        align-items: center;
        /* border:1px solid blue; */
        font-weight: bold;
        font-size: 2rem;
        color: black;
    }
    .ranking_title>div{
        width:5rem;
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: rgb(156, 156, 156);
    }
    .ranking_text{
        width:100%;
        height:50%;
        /* border:1px solid rgba(223, 190, 6, 0.822); */
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        color: rgb(156, 156, 156);
        font-size: 8px;
    }
    .after_ranking_main_box{
        width:87%;
        height:8rem;
        /* border:1px solid red; */
    }
    .after_ranking_main{
        width:100%;
        height:100%;
        display: flex;
    }
    .after_ranking_photo{
        width:40%;
        height:100%;
        /* border:1px solid rgb(41, 161, 241); */
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .after_ranking_photo>div{
        width:95%;
        height:95%;
        /* border: 1px solid red; */
        border-radius: 1rem;
        overflow: hidden;
    }
    .after_ranking_photo>div>img{
        width:100%;
    }
    .after_ranking_center{
        width:58%;
        height:100%;
        /* border:1px solid rgb(90, 13, 13); */
        display: flex;
        flex-direction: column;
        justify-content: space-around;
    }
    .after_ranking_title{
        width:100%;
        height:30%;
        /* border:1px solid rgb(245, 35, 182); */
        color: black;
        font-size: 2rem;
        font-weight: bold;
    }
    .after_ranking_text{
        width:100%;
        height:50%;
        /* border:1px solid rgb(245, 35, 182); */
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
        color: rgb(156, 156, 156);
        font-size: 8px;
    }
    .after_ranking_hit{
        width:100%;
        height:20%;
        /* border:1px solid rgb(245, 35, 182); */
    }
    .after_ranking_hit>div{
        display: flex;
        align-items: center;
        justify-content: flex-start;
        color: rgb(134, 134, 134);
    }
/* 榜单模块 */
    .ranking_right{
        width:28%;
        height:100%;
        display: flex;
        flex-direction: column;
        justify-content: flex-end;
    }
    .advertisement_box{
        width:100%;
        height:91%;
        border:2px solid rgb(255, 153, 0);
        border-radius:  1rem ;
    }
    .before_2{
        width:95%;
        height:70%;
        /* border:1px solid red; */
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
    }
    .after_2{
        width:95%;
        height:70%;
        border:2px solid rgb(255, 153, 0);
        border-radius:  1.2rem 1.2rem 0 0 ;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        font-size: 16px;
        color:rgb(255, 153, 0);
    }
    .left_center_2{
        border: 2px solid rgb(255, 153, 0);
        border-radius:  1rem ;
        width:100%;
        display: flex;
        align-items: center;
        justify-content: space-around;
        flex-wrap: wrap;
        overflow: hidden;
    }
    .recommend_2_box{
        /* border:1px solid red; */
        width:80%;
        height:45rem;
        display: flex;
        justify-content: space-between;
        margin-top: 2%;
    }
/* 新书推荐模块 */
    .news_box{
        width:100%;
        background-color:rgba(102, 207, 211, 0.219) ;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-top: 2%;
    }
    .news_main_box{
        width:80%;
        /* border:1px solid rgb(166, 255, 0); */
        display: flex;
        justify-content: space-between;
    }
    .news_left{
        width:100%;
        height:35rem;
        /* border:1px solid red; */
        display: flex;
        flex-direction: column;
    }
    .news_left_header{
        width:100%;
        height:10%;
        /* border:1px solid rgb(231, 209, 12); */
        display: flex;
        flex-direction: column;
        justify-content: center;
    }
    .news_left_header>p{
        font-size: 2rem;
        font-weight: bold;
        margin-left: 5%;
    }
    .news_left_center{
        width:100%;
        height:90%;
        /* border:1px solid rgb(248, 32, 176); */
        display: flex;
        justify-content: space-between;
        margin-bottom: 2%;
    }
    .news_main{
        width:28%;
        height:100%;
        /* border:1px solid red; */
    }
    .left_center_photo{
        width:100%;
        height:100%;
        border-radius: 1rem;
        border:2px solid #34c6f3da;
        overflow: hidden;
        position: relative;
    }
    .left_center_photo>img{
        width:100%;
    }
    .left_center_text_box{
        width:100%;
        height:20%;
        position: absolute;
        bottom: 0px;
        background-color: rgba(73, 72, 72, 0.384);
    }
    .left_center_text{
        height:100%;
        width:100%;
        /* border:1px solid red; */
        color: white;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
    }
    .news_text{
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        color: white;
    }
</style>