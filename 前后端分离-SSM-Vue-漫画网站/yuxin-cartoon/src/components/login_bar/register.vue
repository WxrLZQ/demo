<template>
  <div class="register_box">
    <div class="register">
      <div class="logo">
        <!-- <div>{{img}}</div> -->
        <div class="logo_name">{{name}}</div>
      </div>
      <div class="title">注册</div>
      <div class="main_box">
          <!-- 邮箱 -->
        <form action style="margin-top:2%">
          <div>{{mains[0].text_1}}</div>
          <input
            type="text"
            v-model="username"
            @blur="switch_email()"
            :placeholder="mains[0].text_2"
          />
        </form>
        <p v-bind:class="check_email">{{email_}}</p>
        <!-- <span>{{validation}}</span> -->

        <!-- qq验证码验证 -->
        <form action class="validation">
          <input 
            type="text" 
            v-model="qqcode" 
            :placeholder="mains[1].text_2" />
          <div>
            <a href="javascript:;" @click="email()">{{mains[1].text_1}}</a>
          </div>
        </form>
        <!-- <p v-bind:class="check_qqcode">{{reqqcode_}}</p> -->

        <form action>
            <!-- 密码 -->
          <div>{{mains[2].text_1}}</div>
          <input
            type="password"
            maxlength="15"
            minlength="8"
            @blur="switch_psw()"
            :placeholder="mains[2].text_2"
            v-model="password"
          />
        </form>
        <p v-bind:class="check_psw">{{password_}}</p>
        <!-- 验证密码 -->
        <form action>
          <input
            type="password"
            maxlength="15"
            minlength="8"
            @blur="switch_repsw()"
            :placeholder="mains[3].text"
            v-model="re_password"
          />
        </form>
        <p v-bind:class="check_repsw">{{repassword_}}</p>
        <!-- 用户名 -->
        <form action>
          <div>{{mains[4].text_1}}</div>
          <input
            type="text"
            :placeholder="mains[4].text_2"
            v-model="nickname"
          />
        </form>
        <!-- 学校名称 -->
        <span class="submit">
          <a href="javascript:;" @click="register()">注册</a>
        </span>
        <span class="login" style="margin-bottom:2%">
          <a href="/Home">{{mains[6].text_1}}</a>
          <a href="/Home/Login">{{mains[6].text_2}}</a>
        </span>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import qs from "qs";
export default {
  data() {
    return {
      img: "LOGO",
      name: "余心漫画",
    //   validation: "验证条",
      username: "",
      password: "",
      nickname: "",
      schoolname:"",
      nickname_: "",

      email_: "",
      password_: "",
      repassword_: "",
      re_password: "",
      check_email: "check_true",
      check_psw: "check_true",
      check_repsw: "check_true",
      check_name: "check_true",
      qqcode: "",
      qqcode_: "",
      reqqcode_: "",
      re_qqcode: "",
      isLogin: "1",
      Date:"",
      mains: [
        {
          text_1: "账号:",
          text_2: "请输入邮箱"
        },
        {
          text_1: "免费获取验证码",
          text_2: "请输入验证码"
        },
        {
          text_1: "密码:",
          text_2: "8-15位数字字母组成"
        },
        {
          text: "请重新输入密码"
        },
        {
          text_1: "用户名:",
          text_2: "请输入名字"
        },
        {
          text_1: "学校:",
          text_2: "请输入学校名称"
        },
        {
          text_1: "返回首页",
          text_2: "立即登录"
        }
      ]
    };
  },
  created() {
  },
  methods: {
    router_login() {
      console.log("注册成功");
      
        setTimeout(() => {
          this.$router.push({
            name: "Login",
            params: {
              username: this.username,
              password: this.password,
            }
          });
        }, 2000);
    },
    register() {
      axios({
        method: "post",
        url: "/api/User/register",
        data: qs.stringify({
            email: this.username,
            password: this.password,
            nickname: this.nickname,
            code: this.qqcode,
        }),
        headers: { "Content-Type": "application/x-www-form-urlencoded" }
      }).then(res => {
          console.log(res);
          this.isLogin = res.data;
          console.log(this.isLogin);
          if(this.isLogin == 1){ 
              alert("注册成功");
              this.router_login();
          }
          if(this.isLogin == 0){
              alert("该用用户已注册");
          }
          if(this.isLogin == 3){
              alert("验证码错误");
          }
      });
    },
    email() {
      axios({
        method: "post",
        url: "/api/Email/send",
        data: qs.stringify({
          user: this.username
        }),
        headers: { "Content-Type": "application/x-www-form-urlencoded" }
      }).then(res => {
        console.log(res);
      });
    },
    switch_email() {
      let email_standard = /^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;
      let username = this.username;
      if (email_standard.test(username)) {
        this.email_ = "邮箱地址可用";
        this.check_email = "check_true";
      } else {
        this.email_ = "请输入合法邮箱地址";
        this.check_email = "check_false";
      }
    },
    switch_psw() {
      let password_standard = /^(?!\d+$)(?![a-zA-Z]+$)[\da-zA-Z]+$/;
      let password = this.password;
      if (password_standard.test(password) && password.length >= 8) {
        this.password_ = "密码可用";
        this.check_psw = "check_true";
      } else {
        this.password_ = "请输入8-15位数字字母密码";
        this.check_psw = "check_false";
      }
    },

    // switch_qqcode() {
    //   let qqcode = this.qqcode;
    //   let re_qqcode = this.re_qqocde;
    //   if (qqcode === re_qqcode && re_qqcode !== " ") {
    //     console.log("验证码正确");
    //     this.reqqcode_ = "√";
    //     this.check_qqcode = "check_true";
    //   } else {
    //     this.reqqcode_ = "验证码错误";
    //     this.check_qqcode = "check_false";
    //   }
    // }

    switch_repsw() {
      let password = this.password;
      let re_password = this.re_password;
      if (password === re_password && re_password !=="") {
        this.repassword_ = "√";
        this.check_repsw = "check_true";
      } else {
        this.repassword_ = "密码输入不一致";
        this.check_repsw = "check_false";
      }
    },
  }
};
</script>
<style >
.logo_name{
    display: flex;
    align-items: center;
    justify-content: center;
}
.register_box {
  width: 100%;
  height: 830px;
  background-image: url("../../../static/images/login.jpg");
  background-attachment: fixed;
  background-size: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}
.register {
  /* border:1px solid red; */
  width: 30rem;
  height: 45rem;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  margin: 2%;
}
.title {
  font-size: 2rem;
  color: rgb(252, 241, 97);
  margin-bottom: 2%;
}
.logo {
  width: 100%;
  height: 10%;
  display: flex;
  justify-content: center;
  align-items: center;
}
.logo > div {
  width: 60%;
  font-size: 2rem;
  color: white;
}
.main_box {
  width: 100%;
  height: 88%;
  border-radius: 10px;
  background-color: rgba(12, 12, 12, 0.1);
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}
.main_box > form {
  width: 80%;
  height: 10%;
  /* border-bottom: 1px solid rgb(207, 207, 207); */
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 2%;
}
.check_true {
  color: rgb(4, 231, 4);
}
.check_false {
  color: red;
}
.main_box > span {
  font-size: 2rem;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.main_box > form {
  font-size: 1.5rem;
  color: white;
}
.main_box > form > input {
  width: 80%;
  height: 80%;
  outline: none;
  border: none;
  background-color: rgba(247, 242, 242, 0);
  color: white;
}
input::-webkit-input-placeholder {
        color: white;
    }
.main_box > span {
  width: 80%;
  height: 10%;
  /* border: 1px solid rgb(226, 50, 50); */
  display: inline-flex;
}
.validation > div {
  width: 60%;
}
.validation > div > a {
  font-size: 1.3rem;
  color: rgb(244, 248, 250);
}
.submit {
  display: flex;
  align-items: center;
  justify-content: center;
}
.submit > a {
  border-radius: 1.5rem;
  height: 80%;
  width: 100%;
  background-color: rgb(252, 241, 97);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.5rem;
  color: #000;
}
.login{
    /* border:1px solid red; */
    width:80%;
    height:10%;
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.login > a {
    /* border: 1px solid rgb(230, 227, 67); */
    font-size: 1.2rem;
    color: rgb(250, 99, 79);
    }
</style>