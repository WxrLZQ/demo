<template>
    <div class="recommended">
        <p>{{text}}</p>
            <div>
                <div v-for="(footer,index) in footers" :key="index">
                    <a href="#"><img :src=footer.img alt=""></a>
                    <p>{{footer.title}}</p>
                    <div>
                        <span>{{footer.hit}}</span>
                        <span>{{footer.comment}}</span>
                    </div>
                </div>
            </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            text:"同类推荐",
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
    }
}
</script>
<style>
    .recommended{
        width:80%;
        border:1px solid rgb(88, 87, 87,0.5);
        border-radius: 10px;
        overflow: hidden;
        margin-bottom: 2%;
     }
     .recommended>p{
         width:100%;
         /* border:1px solid red; */
         background-color:rgba(209, 209, 209, 0.219);
         font-size: 1.2rem;
         padding: 8px;
     }
     .recommended>div{
         display: flex;
         align-items: center;
         justify-content: space-between;
     }
     .recommended>div>div{
         border:1px solid rgba(207, 204, 204, 0.932);
         width:18%;
         margin: 1%;
         border-radius: 10px;
         margin-top: 2%;
         margin-bottom: 2%;
         
     }
     .recommended>div>div>a>img{
         width: 100%;
         border-radius: 10px;
     }
    .recommended>div>div>p{
        font-size: 1.1rem;
        padding: 3px;
    }
    .recommended>div>div>div{
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .recommended>div>div>div>span{
        padding: 3px;
    }
</style>