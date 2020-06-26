import Vue from 'vue'
import Router from 'vue-router'
// import HelloWorld from '@/components/HelloWorld'

import Header from '../components/header/header.vue'
import Home from '../components/home/home.vue'
import Login from '../components/login_bar/login.vue'
import Register from '../components/login_bar/register.vue'
import Classify from '../components/classify/classify.vue'
import Ranking from '../components/ranking/ranking.vue'
import Catalogue from '../components/cartoon/catalogue.vue'
import Cartoon_main from '../components/cartoon/cartoon_main.vue'



Vue.use(Router)

export default new Router({
  mode:'history',

  routes: [
    
    {
      path: '/Header',
      name: 'Header',
      component: Header
    },
    {
      path: '/Home',
      name: 'Home',
      component: Home
    },
    {
      path: '/Home/Login',
      name: 'Login',
      component: Login
    },
    {
      path: '/Home/Register',
      name: 'Register',
      component: Register
    },
    {
      path: '/Classify',
      name: 'Classify',
      component: Classify
    },
    {
      path: '/Ranking',
      name: 'Ranking',
      component: Ranking
    },
    {
      path: '/Home/Catalogue',
      name: 'Catalogue',
      component: Catalogue
    },
    {
      path: '/Home/Catalogue/Cartoon_main',
      name: 'Cartoon_main',
      component: Cartoon_main
    }
  ]
})
