import ERC20Factory from "./data/ERC20Factory.json"
import BasisERC20 from "./data/BasisERC20.json"
import ComplexERC20 from "./data/ComplexERC20.json"
import erc20 from "./data/erc20.json"
const CONTRACTS = {
    ERC20Factory:{address:"0x562dD0aF25F51f3464200E3e85aEF0769cA7E5A6",abi:ERC20Factory},
    BasisERC20:{abi: BasisERC20},
    ComplexERC20:{abi: ComplexERC20},
    erc20:{abi: erc20},
};

function getContractByName(name, web3) {
    return new web3.eth.Contract(CONTRACTS[name].abi, CONTRACTS[name].address, {});
}

function getContractByToken(name, address, web3) {
    return new web3.eth.Contract(CONTRACTS[name].abi, address, {});
}

function getContractAddress(name) {
    return CONTRACTS[name].address;
}

export default {
    CONTRACTS,
    getContractByName,
    getContractByToken,
    getContractAddress
};
