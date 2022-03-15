<template>
  <div class="rain-header" >
    <div class="rainbow-box" :style="dialogVisible ? 'z-index: 1000' :'z-index:10'">
      <div class="center-box">
        <div class="left"  @click="$router.push({name:'tokenList'})" >
          <div class="title" >
            ERC20 TOKEN MINT
          </div>
        </div>
        <div class="rain-header-right">
          <ConnectWallet class="connect-wallet"></ConnectWallet>
        </div>
      </div>
    </div>
    <div class="item-nav-header">

    </div>
  </div>
</template>

<script>
import ConnectWallet from "@/components/ConnectWallet";
import {mapGetters} from "vuex";

export default {
  name: "RainbowHeader",
  components: {
    ConnectWallet,
  },
  data() {
    return {
      dialogVisible: false,
    }
  },
  methods: {
    toggleSideBar(){
      this.$store.dispatch("app/toggleSideBar",!this.sidebar)
    },
    chooseAction(){}
  },

  created() {

  },
  watch: {

  },
  computed: {
    ...mapGetters([
      'isConnected',
      'account'
    ]),
    navArr() {
      return this.$store.state.app.navArr
    },
    account() {
      return this.$store.state.app.account
    },
    sidebar() {
      return this.$store.state.app.isCollapse
    },
    userId() {
      // return this.$store.state.rainbow.userId
      return 0
    }
  }
}
</script>

<style lang="scss" scoped>

.rain-header {
  position: relative;
  z-index: 1000;
  background-image: url("../assets/img/header_bg.png");
  height: 300px;
  background-size: 100% 100%;
  .item-nav-header {
    width: 100%;
  }

  .rainbow-box {
    overflow: hidden;
    height: 60px;
    z-index: 10;
    background-size: cover;
    position: relative;
    border-bottom: 1px solid rgba(255, 255, 255, 0.2);
    .center-box{
      height: 100%;
      align-items: center;
      margin: 0 auto;
      display: flex;
      width: 1300px;
      justify-content: space-between;
    }
    .left {
     .title{
       width: 600px;
       color: #fff;
       font-weight: bold;
       font-size: 30px;
     }

    }
  }

  .connect-wallet {
    ::v-deep .el-button {
      span {
        font-size: 10px;
        padding: 8px 0;
      }
    }
  }

}

</style>
