<template>
  <div class="create-token">
    <div class="create-panel">
      <div class="create-img">
        <img src="../assets/img/create-img1.png" alt="">
      </div>
      <div class="title">
        Token Factory
      </div>
      <div class="sub-title">
        Create your own tokens
      </div>
      <div class="step-box">
        <div class="item" :class="{'active':activeIndex>0}">
          1
        </div>
        <div class="item" :class="{'active':activeIndex>1}">
          2
        </div>
        <div class="item" :class="{'active':activeIndex>2}">
          3
        </div>
        <div class="item" :class="{'active':activeIndex>3}">
          4
        </div>
        <div class="item" :class="{'active':activeIndex>4}">
          5
        </div>
      </div>
      <div class="step" v-show="activeIndex==1">
        <div class="step-title">
          Token Information
        </div>
        <div class="step-content">
          <div class="input-box">
            <div class="input-title">
              <div class="input-name">Token Name</div>
              <input type="text" placeholder="Name" v-model="tokenForm._name">
            </div>
          </div>
          <div class="input-box">
            <div class="input-title">
              <div class="input-name"> Token Symbol
              </div>
              <input type="text" placeholder="Symbol" v-model="tokenForm._symbol">
            </div>
          </div>
          <div class="input-box">
            <div class="input-title">
              <div class="input-name"> Token Logo
              </div>
              <input type="text" placeholder="Logo" v-model="tokenForm._logo">
            </div>
          </div>
          <div class="input-box">
            <div class="input-title">
              <div class="input-name">Token Supply</div>
              <input type="text" placeholder="Supply" v-model="tokenForm._totalSupply">
            </div>
          </div>
          <div class="input-box">
            <div class="input-title">
              <div class="input-name">Decimals</div>
              <input type="text" placeholder="Decimals">
            </div>
          </div>
          <div class="logo-box">
            <div class="logo-title">
              Token Logo
            </div>
            <div class="logo-detail">
              An administrator can change the logo address, but no administrator can change the logo information
            </div>
          </div>
        </div>

      </div>
      <div class="step" v-show="activeIndex==2">
        <div class="step-title">
          Manager
        </div>
        <div class="step-content">
          <div class="select-box">
            <div class="select-title">
              Do You Support Administrators
            </div>
            <select v-model="selectIndex" @change="getSelected">
              <option selected value="0"> Not Support</option>
              <option value="1"> Support</option>
            </select>
          </div>
          <div class="is-support" v-show="selectIndex==1">
            <div class="input-box-full">
              <div class="input-title">
                Administrator Address
              </div>
              <div class="input-detail">
                If not filled, the default creator is the administrator, and if filled, the address filled in is the
                administrator
              </div>
              <input type="text" placeholder="Address" v-model="tokenForm.manager">
            </div>
            <div class="select-box">
              <div class="select-title">
                Whether it has administrator transfer function
              </div>
              <select v-model="isHasAdminTransfer" @change="getSelected">
                <option selected value="0"> No</option>
                <option value="1"> Yes</option>
              </select>
            </div>
            <div class="select-box">
              <div class="select-title">
                Do you support additional issuance
              </div>
              <select v-model="isSupportAdditionalIssuance" @change="getSelected">
                <option selected value="0"> No</option>
                <option value="1"> Yes</option>
              </select>
            </div>
            <div style="margin-top: 30px" class="is-support-additional-issuance" v-show="isSupportAdditionalIssuance == 1">
              <div class="input-title">
                Additional issuance
              </div>
              <div class="red-tip-box">
                Once the ratio is determined, it cannot be changed later.
              </div>
              <div class="line1">
                <div class="left">
                  <div class="input-title">
                    <input type="checkbox" value="">
                    Permanent additional issuance
                  </div>
                  <div class="input-detail">
                    A fixed percentage can be issued each year, which is a percentage of the initial total supply.
                  </div>
                </div>
                <div class="input-box">
                  <div class="input-title">
                    Additional issuance ratio
                  </div>
                  <input type="number" placeholder="Ratio">
                </div>
              </div>
              <div class="line2">
                <div class="input-title">
                  <input type="checkbox" value="">
                  Limit additional issuance
                </div>
              </div>
              <div class="ratio-box">
                <div class="item">
                  <input type="radio" value="">
                  Can be issued
                  <input class="ratio" type="number" placeholder="Ratio">
                  The initial total supply can be issued each year
                  <input class="ratio" type="number" placeholder="Ratio">
                </div>
                <div class="item">
                  <input type="radio" value="">
                  Can be issued
                  <input class="ratio" type="number" placeholder="Ratio">
                  The initial total supply can be issued each year
                  <input class="ratio" type="number" placeholder="Ratio">
                </div>
                <div class="item">
                  <input type="radio" value="">
                  Can be issued
                  <input class="ratio" type="number" placeholder="Ratio">
                  The initial total supply can be issued each year
                  <input class="ratio" type="number" placeholder="Ratio">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="step" v-show="activeIndex==3">
        <div class="step-title">
          Burning
        </div>
        <div class="step-content">
          <div class="select-box">
            <div class="select-title">
              Whether to support burning
            </div>
            <select v-model="selectIndex" @change="getSelected">
              <option selected value="0"> Not Support</option>
              <option value="1"> Support</option>
            </select>
            <div class="is-support" v-show="selectIndex==1">
              <div class="input-box-full">
                <div class="input-title">
                  Administrator Address
                </div>
                <div class="input-detail">
                  If not filled, the default creator is the administrator, and if filled, the address filled in is the
                  administrator
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="step" v-show="activeIndex==4">
        <div class="step-title">
          Trading Fees
        </div>
        <div class="step-content">
          <div class="select-box">
            <div class="select-title">
              Do You Support Administrators
            </div>
            <div class="radio-box">
              <div class="radio-title">
                Trading Fees
              </div>
              <input type="text" placeholder="Ratio">
            </div>
            <div class="red-tip-box">
              There is no administrator for a fixed transaction ratio, and there are administrators who can change the transaction fee ratio.
            </div>
            <div class="select-box">
              <div class="select-title">
                Please set the distribution of transaction fees:
              </div>
              <select v-model="tradingFee" @change="getSelected">
                <option selected value="0"> Transaction fee sent to creator address</option>
                <option value="1"> Support</option>
              </select>
            </div>
            <div class="address-box">
              <div class="item">
                <div class="addressTitle">
                  Address
                </div>
                <div class="ratio">
                  Ratio
                </div>
              </div>
              <div class="item" v-for="index in feeListLength" :key="index">
                <input class="address" type="text" placeholder="Address">
                <div class="ratio">
                  <input type="text" v-model="feeList[index]" placeholder="Ratio">
                </div>
              </div>
              <div class="item">
                <div class="add-btn" @click="feeListLength++">
                  ADD
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="step" v-show="activeIndex==5">
        <div class="step-title">
          Token distribution address
        </div>
        <div class="step-content">
          <div class="select-box">
            <div class="select-title">
              Token distribution address
            </div>
            <select v-model="selectIndex" @change="getSelected">
              <option selected value="0"> All to the creator's address</option>
              <option value="1"> Support</option>
            </select>

          </div>
          <div class="address-box">
            <div class="item">
              <div class="addressTitle">
                Address
              </div>
              <div class="ratio">
                Ratio
              </div>
            </div>
            <div class="item" v-for="index in tokenDistriListLength" :key="index">
              <input class="address" type="text" placeholder="Address">
              <div class="ratio">
                <input type="text" v-model="tokenDistriList[index-1]" placeholder="Ratio">
              </div>
            </div>
            <div class="item">
              <div class="add-btn" @click="tokenDistriListLength++">
                ADD
              </div>
            </div>
          </div>
          <div class="select-tip">
            <div class="left">
              Service Fees:
            </div>
            <div class="right">
              0.02 ETH
            </div>
          </div>
        </div>
      </div>
      <div class="btn-box">
        <div class="next-btn rainbow-btn" v-show="activeIndex>1" @click="back">
          BACK
        </div>
        <div class="next-btn rainbow-btn"  v-show="activeIndex<5" @click="next">
          NEXT
        </div>
        <div class="next-btn rainbow-btn"  v-show="activeIndex==5" @click="complete">
          COMPLETE
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "createToken",
  data() {
    return {
      activeIndex: 1,
      selectIndex: 0,
      isHasAdminTransfer: 0,
      isSupportAdditionalIssuance: 0,
      tradingFee:0,
      feeListLength:1,
      tokenForm:{},

      tokenDistriListLength:1,
      feeList:[],
      tokenDistriList:[],
    }
  },
  methods: {
    creatBasisToken(){
      //        manager, _totalSupply, _name, _symbol, _logo
      this.$store.dispatch("ERC20Factory/creatBasisToken",this.tokenForm).then(res=>{
        console.log(res)
        this.$router.push({name:"tokenList"})
      })
    },
    creatComplexToken(){
      this.$store.dispatch("ERC20Factory/creatComplexToken")
    },
    back() {
      if (this.activeIndex > 1) {
        this.activeIndex--
      }
    },
    next() {
      this.activeIndex++
    },
    getSelected() {

    },
    complete(){
      this.creatBasisToken()
    }
  }
}
</script>

<style lang="scss" scoped>
.create-token {
  .select-tip{
    padding: 10px 0;
    width: 630px;
    display: flex;
    justify-content: space-between;
  }
  .btn-box {
    display: flex;

    .rainbow-btn {
      margin-right: 20px
    }
  }
  .address-box{
    .item{
      padding-left: 10px;
      margin-top: 20px;
      display: flex;
      align-items: center;
      .addressTitle{
        width: 420px;
      }
      .address{
        width: 420px;
        height: 36px;
        line-height: 36px;
        text-align: center;
        background: #f6f5fa;
        border: 1px solid #eaeaea;
        border-radius: 10px;
      }
      .ratio{
        margin-left: 20px;
        width: 200px;
        input{
          padding-left: 10px;
          width: 120px;
          height: 36px;
          background: #f6f5fa;
          border: 1px solid #eaeaea;
          border-radius: 10px;
        }
      }
      .add-btn{
        width: 120px;
        height: 40px;
        background: #f6f5fa;
        border: 1px solid #eaeaea;
        border-radius: 10px;
        text-align: center;
        line-height: 40px;
        cursor: pointer;
      }
    }
  }
  .create-panel {
    width: 1300px;
    margin: 30px auto;
    background: #fff;
    border-radius: 10px;
    padding: 50px;
    position: relative;
    min-height: 600px;
    .create-img{
      position: absolute;
      right: 20px;
      top: 200px;
      img{
        width: 500px;
        height: 270px;
      }
    }
    .title {
      height: 50px;
      font-size: 34px;
      font-weight: 700;
      text-align: left;
      color: #333333;
      line-height: 40px;
    }

    .sub-title {
      height: 28px;
      font-size: 24px;
      font-weight: 500;
      text-align: left;
      color: #333333;
      line-height: 28px
    }

    .step-box {
      display: flex;
      padding: 50px 0 30px;

      .item {
        width: 30px;
        height: 30px;
        background: linear-gradient(135deg, rgba(#12c2e9, 0.2), rgba(#c471ed, 0.2) 53%, rgba(#f64f59, 0.2));
        border: 1px solid rgba(255, 31, 132, 0.20);
        font-size: 16px;
        font-weight: 700;

        border-radius: 50%;
        text-align: center;
        line-height: 30px;
        color: #EC1676;
        margin-right: 80px;
        position: relative;

        &:after {
          content: '';
          position: absolute;
          top: 50%;
          left: 40px;
          width: 60px;
          height: 1px;
          background: #ff1f84;
        }

        &.active {
          color: #fff;
          background: linear-gradient(135deg, #12c2e9, #c471ed 53%, #f64f59);
        }
      }

      .item:last-child {
        &:after {
          visibility: hidden;
        }
      }
    }

    .step {
      .step-title {
        font-size: 20px;
        font-weight: bold;
        text-align: left;
        color: #333333;
        line-height: 24px;
        padding: 30px 0;
      }

      .step-content {
        display: flex;
        flex-wrap: wrap;
        width: 700px;

        .input-box-full {
        }
        .is-support{
          .is-support-additional-issuance{
            .line1{
              width: 830px;
              display: flex;
              justify-content: space-between;
              .input-detail{
                color: #BCBCBC;
                  width: 300px;

              }
              .input-box{
                input{
                  width: 160px!important;
                }
              }
            }
            .line2{
              padding: 10px 0;
            }
            .ratio-box{
              .item{
                margin-top: 20px;
                .ratio{
                  width: 100px;
                  height: 50px;
                  padding-left: 10px;
                  background: #f6f5fa;
                  border: 1px solid #eaeaea;
                  border-radius: 10px;
                }
              }

            }
          }
        }
      }

    }
  }
}
</style>
