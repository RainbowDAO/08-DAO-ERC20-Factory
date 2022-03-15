import Vue from 'vue'
import Vuex from 'vuex'
import getters from './getters'
import app from "./modules/app";
import BasisERC20 from "./modules/BasisERC20";
import ERC20Factory from "./modules/ERC20Factory";
import ComplexERC20 from "./modules/ComplexERC20";
import erc20 from "./modules/erc20";
Vue.use(Vuex)

export default new Vuex.Store({
  getters,
  modules: {
    app,
    BasisERC20,
    ERC20Factory,
    ComplexERC20,
    erc20
  }
})
