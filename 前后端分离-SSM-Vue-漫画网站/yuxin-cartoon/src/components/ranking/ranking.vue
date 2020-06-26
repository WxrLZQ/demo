<template>
    <div class="ranking_boxs">
        <Header></Header>
        <div class="ranking_nav"  >
            <div v-for="(nav,index) in navs" :key="index"
                @click="ranking_list_request(index)">
                <p>{{nav.text}}</p>
            </div>
        </div>
        <div class="ranking_main_boxs">
            <a class="ranking_mains" v-for="(list,index) in ranking_cartoon" :key="index" href="">
                <div class="rankings_photo">
                    <img :src=list.url alt="">
                </div>
                <div class="rankings_text">
                    <div class="rankings_title">
                        <i class="el-icon-trophy">{{index+1}}</i>
                        <p>{{list.title}}</p>
                    </div>
                    <span>{{list.author}}</span>
                    <p>{{list.text}}</p>
                </div>
            </a>
        </div>
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
            navs:[
                {
                    text:"综合榜",
                    rankid:"0",
                },
                {
                    text:"口碑榜",
                    rankid:"1",
                },
                {
                    text:"畅销榜",
                    rankid:"2",
                },
                {
                    text:"新作榜",
                    rankid:"3",
                },
                {
                    text:"完结榜",
                    rankid:"4",
                },
            ],
            ranking_cartoon:[
                {
                    url:"../../../static/images/footer_1.jpg",
                    title:"青空下",
                    author:"北巷",
                    text:"《青空之夏》第二季回归！意外的失忆，让江雪忘记了这个改变自己的男孩夏至，由此，在一起追逐篮球梦的过程中，不为人知的过往逐渐被揭开"
                },
                {
                    url:"../../../static/images/footer_1.jpg",
                    title:"青空下",
                    author:"北巷",
                    text:"《青空之夏》第二季回归！意外的失忆，让江雪忘记了这个改变自己的男孩夏至，由此，在一起追逐篮球梦的过程中，不为人知的过往逐渐被揭开"
                },
                {
                    url:"../../../static/images/footer_1.jpg",
                    title:"青空下",
                    author:"北巷",
                    text:"《青空之夏》第二季回归！意外的失忆，让江雪忘记了这个改变自己的男孩夏至，由此，在一起追逐篮球梦的过程中，不为人知的过往逐渐被揭开"
                },

                {
                    url:"../../../static/images/footer_1.jpg",
                    title:"青空下",
                    author:"北巷",
                    text:"《青空之夏》第二季回归！意外的失忆，让江雪忘记了这个改变自己的男孩夏至，由此，在一起追逐篮球梦的过程中，不为人知的过往逐渐被揭开"
                },
                {
                    url:"../../../static/images/footer_1.jpg",
                    title:"青空下",
                    author:"北巷",
                    text:"《青空之夏》第二季回归！意外的失忆，让江雪忘记了这个改变自己的男孩夏至，由此，在一起追逐篮球梦的过程中，不为人知的过往逐渐被揭开"
                },

                {
                    url:"../../../static/images/footer_1.jpg",
                    title:"青空下",
                    author:"北巷",
                    text:"《青空之夏》第二季回归！意外的失忆，让江雪忘记了这个改变自己的男孩夏至，由此，在一起追逐篮球梦的过程中，不为人知的过往逐渐被揭开"
                },
                
            ],
        }
    },
    created(){
        this.ranking_create_request();
    },
    methods:{
        // 创建页面请求
        ranking_create_request() {
            axios({
                method: "post",
                url: "/api/goods/all",
                data: qs.stringify({
                    // 发送数据
                }),
                headers: { "Content-Type": "application/x-www-form-urlencoded" }
            }).then(res => {
                // 获取数据
                console.log(res);
                this.ranking_cartoon = res.data;
            });
        },
        // 筛选条件请求
        ranking_list_request(index) {
            axios({
                method: "post",
                url: "/api/goods/all",
                data: qs.stringify({
                    // 发送数据
                    rankid:this.navs[index].rankid
                }),
                headers: { "Content-Type": "application/x-www-form-urlencoded" }
            }).then(res => {
                // 获取数据
                console.log(res);
                this.ranking_cartoon = res.data;
            });
        },
    }
}
</script>
<style scoped>
    .ranking_boxs{
        width: 100%;
        background-color: rgb(253, 253, 253);
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;
    }
/* 选项卡模块 */
    .ranking_nav{
        margin-top: 2%;
        width:80%;
        height:5rem;
        border-bottom:1px solid rgb(195, 192, 192);
        display: flex;
        align-items: center;
    }
    .ranking_nav>div{
        width:10%;
        height:80%;
        /* border:1px solid red; */
        font-size: 1.5rem;
        display: flex;
        align-items: center;
        cursor: pointer;
        margin-right: 2%;
    }
    .ranking_nav>div>p{
        font-size: 2.5rem;
    }
/* 漫画列表模块 */
    .ranking_main_boxs{
        margin-top: 2%;
        margin-bottom: 2%;
        width:80%;
        /* border:1px solid rgb(245, 59, 59); */
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }
    .ranking_mains{
        width:29rem;
        height:15rem;
        /* border:1px solid rgb(192, 192, 191); */
        display: flex;
        margin-bottom: 2rem;
        justify-content: space-between;
    }
    .rankings_photo{
        width:47%;
        height:100%;
        /* border:1px solid red; */
        border-radius: 1rem;
        overflow: hidden;
    }
    .rankings_photo>img{
        width:100%;
    }
    .rankings_text{
        width:50%;
        height:100%;
        /* border:1px solid red; */
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }
    .rankings_title{
        width:100%;
        display: flex;
        align-items: center;
        font-size: 2.3rem;
        color: black;
    }
    .rankings_title>i{
        color: rgb(250, 49, 14);
        font-weight: bold;
        margin-right: 1rem;
    }
    .rankings_title>p{
        font-weight: bold;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;

    }
    .rankings_text>p{
        color: rgb(132, 133, 132);
        font-size: 1.6rem;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 5;
        -webkit-box-orient: vertical;
    }
    .rankings_text>span{
        font-size: 2rem;
        color: black;
    }
</style>