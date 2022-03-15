import Vue from 'vue'
import VueRouter from 'vue-router'
import layout from "@/layout";

Vue.use(VueRouter)

const routes = [
    {
        path: '/404',
        component: () => import('@/views/errorPage/404'),
        hidden: true
    },
    {
        path: '/',
        component: layout,
        redirect: '/',
        children: [
            {
                path:'/createToken',
                name:'createToken',
                component: () => import('../views/createToken')
            },
            {
                path:'/',
                name:'tokenList',
                component: () => import('../views/tokenList')
            },
            {
                path:'/manageList',
                name:'manageList',
                component: () => import('../views/manageList')
            },
        ]
    }
]
const router = new VueRouter({
    routes
})

export default router
