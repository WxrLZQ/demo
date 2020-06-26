<template>
    <div class="classify_box">
        <Header></Header>
        <!-- 筛选条件 -->
        <div class="classify_tag">

             <div class="tag_main tag_" >
                <div class="tag_main_title">
                    {{tag_main_title}}
                </div>
                <div class="tag_main_text">
                    <div v-for="(tag,index) in tags" :key="index">
                        <span>{{tag}}</span>
                        <span><a href="javascript:;"  style="color:black"  @click="remove(index)">×</a></span>
                    </div>
                </div>
            </div>
            
            <div class="tag_main" v-for="(main,index) in mains" :key="index">
                <div class="tag_title">
                    {{main.title}}
                </div>
                <div class="tag_text" >
                    <div v-for="(text,i) in main.list" :key="i" @click="input_text(text,index,i)" v-bind:class="{active:main.index===i}" >
                        <a href="javascript:;" >
                            {{text}}
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- 漫画列表 -->
        <div class="classify_main_box">
            <div class="classify_main" v-for="(list,index) in lists" :key="index">
                <div class="classify_photo">
                    <img :src=list.img alt="">
                </div>
                <div class="classify_title">
                    <p>{{list.title}}</p>
                </div>
                <div class="classify_text">
                    <p>{{list.author}}</p>
                    <div>
                        <i class="el-icon-thumb"></i>
                        <p>99万+</p>
                    </div>
                </div>
            </div>
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
            tag_main_title:"已选",
            num_1:"0",
            num_2:"0",
            mains:[
                {
                    title:"题材",
                    list:['全部','正能量','校园','玄幻','日漫','灵异','都市','古风','治愈','萌系']
                },
                {
                    title:"类别",
                    list:['全部','连载中','完结']
                }
            ],
            tags:{},
            lists:[
            ],
        }
        mains.forEach(tag=>tag.index=-1) 
    },
    created(){
        this.ranking_create_request();
    },
    methods:{
        check_num(){
            let tag_1 = this.tags[0];
            let tag_2 = this.tags[1];
            console.log(tag_1,tag_2);
            let num_1,num_2;
            switch(tag_1){
                case "全部":num_1 = 0;break;
                case "正能量":num_1 = 1;break;
                case "校园":num_1 = 2;break;
                case "玄幻":num_1 = 3;break;
                case "日漫":num_1 = 4;break;
                case "灵异":num_1 = 5;break;
                case "都市":num_1 = 6;break;
                case "古风":num_1 = 7;break;
                case "治愈":num_1 = 8;break;
                case "萌系":num_1 = 9;break;
                default:num_1 = null;
            }
            switch(tag_2){
                case "全部":num_2 = 0;break;
                case "连载中":num_2 = 1;break;
                case "完结":num_2 = 2;break;
                default:num_2 = null;
            }
            console.log(num_1,num_2);
            this.num_1 = num_1;
            this.num_2 = num_2;
            console.log(this.num_1,this.num_2);
        },
        list_request() {
            console.log();
            axios({
                method: "post",
                url: "/api/Cartoon/sort",
                data: qs.stringify({
                    // 发送数据
                    num_1:this.num_1,
                    num_2:this.num_2,
                }),
                headers: { "Content-Type": "application/x-www-form-urlencoded" }
            }).then(res => {
                // 获取数据
                console.log(res);
                this.lists = res.data;
            });
        },
        input_text(text,index,i){
            this.$set(this.tags,index,text);
   			//找到操作的这一行，把这一行的数据中的index，设置为点击的标签的下标 
            this.mains[index].index=i;
            this.check_num();
            this.list_request();
        },
        remove(index){
            this.check_num();
            this.list_request();
            this.$delete(this.tags,index,index);
            this.mains[index].index=-1;
        },
        ranking_create_request() {
            axios({
                method: "post",
                url: "/api/Cartoon/sort",
                data: qs.stringify({
                    // 发送数据
                    num_1:this.num_1,
                    num_2:this.num_2,
                }),
                headers: { "Content-Type": "application/x-www-form-urlencoded" }
            }).then(res => {
                // 获取数据
                console.log(res);
                this.lists = res.data;
            });
        },
        
    },
}
</script>
<style scoped>
    .classify_box{
        width: 100%;
        background-color:white;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
/* 筛选条件 */
    .classify_tag{
        margin-top: 1%;
        width:80%;
        display: flex;
        flex-direction: column;
        margin-bottom: 2%;
        /* border:1px solid red; */
    }
    .classify_tag>div{
        margin-top: 2%;
    }
    .tag_main{
        width:100%;
        height:4rem;
        display: flex;
        align-items: center;
    }
    .tag_{
        border-bottom: 1px solid rgb(200, 199, 199);
    }
    .tag_main_title,.tag_title{
        width:5%;
        height:100%;
        font-size: 1rem;
        color: rgb(173, 173, 173);
        display: flex;
        align-items: center;
        /* border:1px solid red; */
    }
    .tag_main_text{
        width:60%;
        height:100%;
        /* border:1px solid red; */
        font-size: 1.5rem;
        display: flex;
        align-items: center;
    }
    .tag_main_text>div{
        font-size: 1.2rem;
        border-radius: 5px;
        background-color: rgb(248, 230, 68);
        padding: 5px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 10px;
    }
    .tag_text{
        width:60%;
        /* border:1px solid red; */
        display: flex;
    }
    .tag_text>div{
        border:1px solid rgb(223, 186, 186);
        height:2rem;
        width:10%;
        margin-right: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
    }
    .active{
        background-color: rgb(248, 230, 68);
        border: none;
    }
    .tag_text>div>a{
        color: rgb(55, 55, 56);
    }
/* 漫画列表 */
    .classify_main_box{
        width:80%;
        /* border:1px solid red; */
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
        margin-bottom: 1%;
    }
    .classify_main{
        width:15.5rem;
        height:23rem;
        /* border:1px solid red; */
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        margin-top: 1rem;
    }
    .classify_photo{
        width:100%;
        height:83%;
        /* border:1px solid red; */
        overflow: hidden;
        border-radius: 0.5rem;
    }
    .classify_photo>img{
        width:100%;
    }
    .classify_title{
        width:100%;
        height:6%;
        /* border:1px solid rgb(248, 244, 23); */
        font-size: 2rem;
        font-weight: bold;
        display: flex;
        align-items: center;
    }
    .classify_text{
        width:100%;
        height:6%;
        /* border:1px solid #0ec1ee; */
        display: flex;
        color: rgb(102, 102, 102);
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .classify_text>div{
        width:4rem;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
</style>