<template>
  <div class="token-list">
    <div class="title" style="display: flex;justify-content: space-between">
      My Token List
      <div class="rainbow-button" style="width: 100px" @click="$router.push({name:'createToken'})">
        CREATE
      </div>
    </div>
    <div class="list">
      <div class="header">
        <div class="id">ID</div>
        <div class="token" style="width: 260px">Token</div>
        <div class="symbol">
          Symbol
        </div>
        <div class="initial">
          Decimals
        </div>
        <div class="supply">
          Total Supply
        </div>

        <div class="operation">
          Operation
        </div>
      </div>
      <div class="item" v-for="(item,index) in tokenArr" :key="index">
        <div class="id">{{ index }}</div>
        <div class="token" style="width: 300px">{{item.address}}</div>
        <div class="symbol">
          {{ item.symbol }}
        </div>
        <div class="decimals">
          {{ item.decimals }}
        </div>
        <div class="supply">
          {{ item.totalSupply }}
        </div>

        <div class="operation">
          <div class="rainbow-btn" @click="$router.push({name:'manageList',params:item.address})">
            Manage
          </div>
        </div>
      </div>
    </div>
    <div class="dialog" v-show="isShowDialog">
      <div class="dialog-mask"  @click="isShowDialog=false">

      </div>
      <div class="dialog-content">
        <div class="title">
          Holders
        </div>
        <div class="list">
          <div class="header">
            <div class="holder">
              Holders Address
            </div>
            <div class="token">
              Token
            </div>
            <div class="balance">
              Balance
            </div>
          </div>
          <div class="item">

          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {mapGetters} from "vuex"
export default {
  name: "tokenList",
  data(){
    return{
      isShowDialog:false,
      tokenList:[],
      tokenArr:[]
    }
  },
  created() {
    this.getRegistry()
  },
  watch:{
    isConnected(){
      this.getRegistry()
    }
  },
  computed: {
    ...mapGetters([
      'isConnected',
      'account'
    ]),
  },
  methods:{
    getRegistry(){
      this.$store.dispatch("ERC20Factory/getRegistry",{user:this.account}).then(async res=>{
        console.log(res)
        let tokenArr = []
        this.tokenList = res
        for (const item of this.tokenList) {
          let name =await this.$store.dispatch("BasisERC20/name",item)
          console.log(name)
          let logo =await this.$store.dispatch("BasisERC20/logo",item)
          let symbol =await this.$store.dispatch("BasisERC20/symbol",item)
          let decimals =await this.$store.dispatch("BasisERC20/decimals",item)
          let totalSupply =await this.$store.dispatch("BasisERC20/totalSupply",item)
          let name2 = await  this.$store.dispatch("erc20/name", item)
          console.log(name2)
          tokenArr.push({
            address:item,
            name,
            logo,
            symbol,
            totalSupply,
            decimals
          })
          this.tokenArr = tokenArr
          console.log(tokenArr)
        }
      })
    },
  }
}
</script>

<style lang="scss" scoped>
.token-list{
  width: 1300px;
  margin: 20px auto;
  padding: 50px;
  background: #ffffff;
  border-radius: 8px;
  box-shadow: 0px 20px 20px 3px rgba(156,156,156,0.10);
  .title{
    height: 40px;
    font-size: 34px;
    font-weight: 700;
    text-align: left;
    color: #333333;
    line-height: 40px;
  }
  .list{
    margin-top: 30px;
    width: 100%;
    .header{
      font-weight: bold;
      color: #891E99;
      height: 50px;
      background: #f7f3ff;
      border-radius: 10px;
      line-height: 50px;
      display: flex;
      justify-content: space-between;
      padding: 0 20px;
    }
    .item{
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 20px 30px;
      border-bottom: 1px solid #eee;
      .operation{
        .rainbow-btn{
          margin:0!important;
          width: 100px!important;
          height: 30px!important;
          line-height: 30px!important;
        }
      }
    }
  }
  .dialog{
    width: 100%;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
    .dialog-mask{
      width: 100%;
      height: 100%;
      opacity: 0.4;
      background: #000000;
      position: absolute;
      left: 0;
      top: 0;
    }
    .dialog-content{
      position: absolute;
      left: calc(50% - 400px);
      top: 20%;
      width: 800px;
      padding: 20px 30px 60px;
      background: #ffffff;
      border-radius: 20px;
      box-shadow: 0px 20px 20px 3px rgba(156,156,156,0.10);

    }

  }
}
</style>
