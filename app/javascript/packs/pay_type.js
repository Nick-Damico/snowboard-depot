import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import PayType from '../pay_type.vue'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#paytype',
    data: () => {
      return {
        message: "Select Pay Type"
      }
    },
    components: { "pay-type": PayType }
  })
})
