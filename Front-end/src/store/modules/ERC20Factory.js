import getContract from '@/abi/index'

const state = {
    token: null,
    daoAddress: null
}
const mutations = {
    SET_DAOADDRESS(state, address) {
        state.daoAddress = address
    }
}

function judgeToken(rootState) {
    if (!state.token) state.token = getContract.getContractByName("ERC20Factory", rootState.app.web3)
}

const actions = {
    _USER_STD_REGISTRY_({rootState}, {param0, param1}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods._USER_STD_REGISTRY_(param0, param1).call().then(res => {
                resolve(res)
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    admin({rootState}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.admin().call().then(res => {
                resolve(res)
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    fee({rootState}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.fee().call().then(res => {
                resolve(res)
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    tokenaddress({rootState}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.tokenaddress().call().then(res => {
                resolve(res)
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    changeOwner({rootState}, {manager}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.changeOwner(manager).estimateGas({
                from: rootState.app.account,
            }).then(gas => {
                state.token.methods.changeOwner(manager).send({
                    from: rootState.app.account,
                    gas: parseInt(gas * 1.2)
                }).then(res => {

                    resolve(res)
                })
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    changefee({rootState}, {_token, _fee}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.changefee(_token, _fee).estimateGas({
                from: rootState.app.account,
            }).then(gas => {
                state.token.methods.changefee(_token, _fee).send({
                    from: rootState.app.account,
                    gas: parseInt(gas * 1.2)
                }).then(res => {

                    resolve(res)
                })
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    creatBasisToken({rootState}, {manager, _totalSupply, _name, _symbol, _logo}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.creatBasisToken(manager, _totalSupply, _name, _symbol, _logo).estimateGas({
                from: rootState.app.account,
            }).then(gas => {
                state.token.methods.creatBasisToken(manager, _totalSupply, _name, _symbol, _logo).send({
                    from: rootState.app.account,
                    gas: parseInt(gas * 1.2)
                }).then(res => {

                    resolve(res)
                })
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    creatComplexToken({rootState}, {
        manager,
        _totalSupply,
        _mintfee,
        _burnfee,
        _fee,
        _endtime,
        minter,
        minterfee,
        _name,
        _symbol,
        _logo
    }) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.creatComplexToken(manager, _totalSupply, _mintfee, _burnfee, _fee, _endtime, minter, minterfee, _name, _symbol, _logo).estimateGas({
                from: rootState.app.account,
            }).then(gas => {
                state.token.methods.creatComplexToken(manager, _totalSupply, _mintfee, _burnfee, _fee, _endtime, minter, minterfee, _name, _symbol, _logo).send({
                    from: rootState.app.account,
                    gas: parseInt(gas * 1.2)
                }).then(res => {

                    resolve(res)
                })
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    getRegistry({rootState}, {user}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.getRegistry(user).call().then(res => {
                resolve(res)
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
}

export default {
    namespaced: true,
    state,
    mutations,
    actions
}

