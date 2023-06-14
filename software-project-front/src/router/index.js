import Vue from 'vue'
import VueRouter from 'vue-router'
import Layout from '../views/layout'
import Login from '../views/LoginView.vue'
import Register from '../views/RegisterView.vue'
import Index from '../views/CarouselView.vue'
import Goods from '../views/Goods'
import Order from '../views/Order'
import User from '../views/User'
import Analyze from '../views/Analyze'
import AnalyzeAll from '../views/AnalyzeAll'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Index',
    component: Index
  },
  {
    path: '/Register',
    name: 'Register',
    component: Register
  },
  {
    path: '/Home',
    name: 'Layout',
    component: Layout,
    redirect: '/Goods',
    children: [
      {
        path: '/Goods',
        name: 'Goods',
        component: Goods,
      },
      {
        path: '/Order',
        name: 'Order',
        component: Order
      },
      {
        path: '/user',
        name: 'User',
        component: User
      },
      {
        path: '/analyze',
        name: 'Analyze',
        component: Analyze
      },
      {
        path: '/analyzeall',
        name: 'AnalyzeAll',
        component: AnalyzeAll
      }
    ]
  },
  {
    path: '/Login',
    name: 'Login',
    component: Login
  }
]

const router = new VueRouter({
  routes
})

export default router
