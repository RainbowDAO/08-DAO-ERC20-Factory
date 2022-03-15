<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>


export default {
  name: 'App',
  components: {

  }
}
</script>

<style lang="scss">
#app {
  $glass: rgba(255, 255, 255, 0.2);
  $glass-icon: rgba(255, 255, 255, 0.3);
  $gradient: linear-gradient(35deg, red, purple);
  .rainbow-btn{
    text-align: center;
    width: 160px;
    height: 40px;
    background: linear-gradient(90deg,#12c2e9 0%, #c471ed 64%, #f64f59 100%);
    border: 1px solid #eaeaea;
    border-radius: 10px;
    line-height: 40px;
    margin-top: 20px;
    color: #fff;
    cursor: pointer;
    user-select: none;
    &:active{
      transform: translate(2px, 2px);
    }
  }
  .input-box-full{
    width: 100%!important;
    margin-top: 20px;

  }
  .input-title,.radio-title{
    font-size: 16px;
    font-weight: bold;
    text-align: left;
    color: #333333;
    line-height: 40px;
  }
  .radio-box{

    input{
      width:160px!important;
    }
  }
  .input-box,.input-box-full,.radio-box{
    width: 50%;

    input{
      width: 310px;
      height: 50px;
      background: #f6f5fa;
      border: 1px solid #eaeaea;
      border-radius: 10px;
      padding: 0 10px;
    }
    .input-detail{
      padding: 10px 0;
      color: #bcbcbc;
    }
  }
  .logo-box{
    padding-top: 30px;
    .logo-title{
      font-weight: bold;
      font-size: 16px;
      color: #333333;
      line-height: 50px;
    }
    .logo-detail{
      color: #bcbcbc;
    }
  }
  .select-box{
    width: 100%;
    .select-title{
      font-size: 16px;
      font-weight: bold;
      text-align: left;
      color: #333333;
      line-height: 50px;
    }
  }
  .red-tip-box{
    margin-top: 20px;
    background: rgba(255,31,132,0.10);
    border-radius: 10px;
    line-height: 30px;
    padding: 10px 20px;
    color:#FF1F84;
  }
  select {
    appearance: none;
    border: 0;
    outline: 0;
    font: inherit;
    /* Personalize */
    width: 90%;
    height: 3em;
    padding: 0 4em 0 1em;
    background: #f6f5fa;
    color: #333;
    border-radius: 0.25em;
    cursor: pointer;
    /* <option> colors */
    option {
      color: inherit;
      background-color: #fff;
    }

    /* Remove focus outline */
    &:focus {
      outline: none;
    }

    /* Remove IE arrow */
    &::-ms-expand {
      display: none;
    }
  }
}
</style>
