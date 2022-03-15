# Documentation on how to run the project

## Contract introduction

- ERC20Factory: Users can create their own Token through factory contracts,displays a list of Token  information,It's a collection of all the contracts.
- ComplexERC20:  It is used to  save the basic information and types of token and mint token。
- BasisERC20: It is used to  save the basic information and types of token.

## Dependencies

- Linux or Mac
- node ≥ 14

## Network & Contract

- Network Name: Aurora Testnet
- RPC URL: [https://testnet.aurora.dev](https://testnet.aurora.dev/)

### contract address

#### ERC20Factory

0x6bA328D11E50d2A2862B6032BF91b166d1558425

## Installing

```
git clone git@github.com:lawrenceAigo/05-ETHDenver2022-DAO-ERC20-Factory.git
cd 05-ETHDenver2022-DAO-ERC20-Factory/Solidity-contract
npm install
```

**Note**: Only the Metamask wallet is available for this demo

## Deploy Contracts

Open a local node or complete the information in the `truffle-config.js` and add the mnemonic to the `secret`

```
npm install -g @truffle/hdwallet-provider
truffle compile && truffle migrate
```

You will deploy contracts

- TokenFactory

## Create a Token 

The creatToken  in the TokenFactory contract creates a Token of its own, defining names, logos, and symbols,_totalSupply,_burn fee,mint fee,fee,

```
creatBasisToken()` or `creatComplexToken()
```

