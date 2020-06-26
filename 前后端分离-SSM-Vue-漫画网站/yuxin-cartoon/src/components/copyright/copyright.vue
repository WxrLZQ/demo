<template>
        <div class="copyright">
            <div class="copyright_top">
                <div class="copyright_top_left">
                    <p class="company">余心漫画科技有限公司</p>
                    <p>全部信息 余心漫画 版权所有 未经许可 严禁转载</p>
                    <p>Copyright © 2020 yuxinmanhua.com All Rights Reserved</p>
                </div>
                <div class="copyright_top_right">
                    <div class="copyright_nav">
                        <a href="#"><p>首页</p></a>
                        <a href="#"><p>加入我们</p></a>
                        <a href="#"><p>我要投稿</p></a>
                        <a href="#"><p>联系我们</p></a>
                    </div>
                </div>
            </div>
            <div class="copyright_bottom">
                <span>
                    <a href="#"><P>粤公网安备 11010502035069号 </P></a>
                    <P>|</P>
                    <a href="#"><P>粤 ICP 备15052188号-2</P></a>
                    <P>|</P>
                    <a href="#"><P>网络文化经营许可证 粤网文 [2019] 3387-325号</P></a>
                </span>
                <span>
                    <a href="#"><P>营业执照</P></a>
                    <P>|</P>
                    <a href="#"><P>营业性演出许可证 京演（机构）[2018] 3702号</P></a>
                    <P>|</P>
                    <a href="#"><P>出版物经营许可证 新出发京批字第直160194号</P></a>
                    <P>|</P>
                    <a href="#"><P>食品经营许可证 JY11105092072844</P></a>
                </span>
                <span>
                    <a href="#"><P>举报电话：010-58527324</P></a>
                    <P>|</P>
                    <a href="#"><P>举报邮箱：jubaoyouxiang@kkworld.com</P></a>
                </span>
            </div>
        </div>   
</template>
<script>
export default {
    
}
</script>
<style>
    .copyright{
        width:100%;
        height:20rem;
        background-color: black;
        display: flex;
        align-items: center;
        flex-direction: column;
        justify-content: center;
    }
    .copyright_top{
        height:50%;
        width:70%;
        display: flex;
    }
    .copyright_top_left{
        width:50%;
        height:100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }
    .copyright_top_left>p{
        color: rgb(131, 131, 131);
        margin-bottom: 1%;;
    }
    .company{
        font-size: 1.2rem;
    }
    .copyright_top_right{
        width:50%;
        height:100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }
    .copyright_nav{
        width:100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .copyright_nav>a>p{
        color: rgb(131, 131, 131);
    }
    .copyright_bottom{
        height:50%;
        width:70%;

        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }
    .copyright_bottom>span{
        display: flex;
        margin-bottom: 1%;
    }
    .copyright_bottom>span>a>p{
        color: rgb(131, 131, 131);
    }
    .copyright_bottom>span>a{
        margin-left: 1rem;
    }
</style>