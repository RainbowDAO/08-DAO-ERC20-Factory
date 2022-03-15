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

function judgeToken(rootState,address) {
    if (!state.token) state.token = getContract.getContractByToken("BasisERC20",address, rootState.app.web3)
}

const actions = {
    allowance({rootState}, {owner, spender}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.allowance(owner, spender).call().then(res => {
                resolve(res)
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    approve({rootState}, {spender, amount}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.approve(spender, amount).estimateGas({
                from: rootState.app.account,
            }).then(gas => {
                state.token.methods.approve(spender, amount).send({
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
    balanceOf({rootState}, {account}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.balanceOf(account).call().then(res => {
                resolve(res)
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    checkpoints({rootState}, {param0, param1}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.checkpoints(param0, param1).call().then(res => {
                resolve(res)
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    decimals({rootState},addr) {
        judgeToken(rootState,addr)
        return new Promise((resolve, reject) => {
            state.token.methods.decimals().call().then(res => {
                resolve(res)
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    decreaseAllowance({rootState}, {spender, subtractedValue}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.decreaseAllowance(spender, subtractedValue).estimateGas({
                from: rootState.app.account,
            }).then(gas => {
                state.token.methods.decreaseAllowance(spender, subtractedValue).send({
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
    increaseAllowance({rootState}, {spender, addedValue}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.increaseAllowance(spender, addedValue).estimateGas({
                from: rootState.app.account,
            }).then(gas => {
                state.token.methods.increaseAllowance(spender, addedValue).send({
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
    logo({rootState},coinAddr) {
        judgeToken(rootState,coinAddr)
        return new Promise((resolve, reject) => {
            state.token.methods.logo().call().then(res => {
                resolve(res)
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    name({rootState},coinAddr) {
        judgeToken(rootState,coinAddr)
        return new Promise((resolve, reject) => {
            state.token.methods.name().call().then(res => {
                resolve(res)
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    numCheckpoints({rootState}, {param0}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.numCheckpoints(param0).call().then(res => {
                resolve(res)
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    symbol({rootState},address) {
        judgeToken(rootState,address)
        return new Promise((resolve, reject) => {
            state.token.methods.symbol().call().then(res => {
                console.log(res)
                resolve(res)
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    totalSupply({rootState},addr) {
        judgeToken(rootState,addr)
        return new Promise((resolve, reject) => {
            state.token.methods.totalSupply().call().then(res => {
                resolve(res)
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    transfer({rootState}, {recipient, amount}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.transfer(recipient, amount).estimateGas({
                from: rootState.app.account,
            }).then(gas => {
                state.token.methods.transfer(recipient, amount).send({
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
    transferFrom({rootState}, {sender, recipient, amount}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.transferFrom(sender, recipient, amount).estimateGas({
                from: rootState.app.account,
            }).then(gas => {
                state.token.methods.transferFrom(sender, recipient, amount).send({
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
    getCurrentVotes({rootState}, {account}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.getCurrentVotes(account).call().then(res => {
                resolve(res)
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    getPriorVotes({rootState}, {account, blockNumber}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.getPriorVotes(account, blockNumber).call().then(res => {
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

