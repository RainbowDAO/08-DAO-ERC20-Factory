<template>
<div class="manage-list">
  <div class="title" style="display: flex;justify-content: space-between">
    Manage
    <div class="rainbow-button" @click="isShowDialog=true">
      Add Address
    </div>
  </div>
  <div class="list">
    <div class="header">
      <div class="id">ID</div>
      <div class="supply">
        Total Supply
      </div>
      <div class="available">Available this year</div>
      <div class="added">
        Added this year
      </div>
      <div class="offerings">
        Additional offerings this year
      </div>
    </div>
    <div class="item">
      <div class="id">1</div>
      <div class="supply">10000000</div>
      <div class="available">
        10
      </div>
      <div class="added">
        10
      </div>
      <div class="offerings">
        10000
      </div>
    </div>
  </div>
  <div class="dialog" v-show="isShowDialog">
    <div class="dialog-mask" @click="isShowDialog=false">

    </div>
    <div class="dialog-content">
      <div class="title">
        Add Address
      </div>
      <div class="select-box">
        <div class="select-title">
          Do You Support Administrators
        </div>
        <select v-model="selectIndex" @change="getSelected">
          <option selected value="0"> Not Support</option>
          <option value="1"> Support</option>
        </select>
      </div>
      <div class="input-item">
        <div class="left">
          The amount that can be issued at this stage
        </div>
        <input type="text" aria-placeholder="100，000，000">
      </div>
      <div class="input-item">
        <div class="left">
          The actual number of additional issuances at this stage
        </div>
        <input type="text" aria-placeholder="Enter">
      </div>
      <div class="red-tip-box">
        The actual number of additional issuances must be less than the number of additional issuances
      </div>
      <div class="rainbow-btn">
        COMPLETE
      </div>
    </div>
  </div>
</div>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "manageList",
  data(){
    return{
      isShowDialog:false,
      selectIndex:0,
      coinAddress:""
    }
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
  created() {
    this.coinAddress = this.$route.params
  },
  methods:{
    mint(){
      this.$store.dispatch("ComplexERC20/mint")
    },
    getSelected(){

    },
    getMintamountsSupply(){
      // this.$store.dispatch("ComplexERC20/Mint",{
      //   account:this.account, blockNumber,addr:this.coinAddress
      // }).then(res=>{
      //
      // })
    }
  }
}
</script>

<style lang="scss" scoped>
.manage-list{
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
      .input-item{
        display: flex;
        width: 90%;
        justify-content: space-between;
        padding: 10px 0;
        align-items: center;
        input{
          width: 184px;
          height: 36px;
          background: #f6f5fa;
          border: 1px solid #eaeaea;
          border-radius: 10px;
          text-align: center;
        }
      }
      .red-tip-box{
        width: 90%;
      }
    }

  }
}
</style>
