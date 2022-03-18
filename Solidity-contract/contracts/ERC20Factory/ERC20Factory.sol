// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../ERC20/ComplexERC20.sol"; 
import "../ERC20/BasisERC20.sol"; 


contract ERC20Factory{
    
    address public admin;
    address public tokenaddress;
    uint public fee;
    // struct tokeninfo {
    //     address manager;
    //     uint256 _totalSupply;
    //     string  _name;
    //     string _symbo;
    // }
    mapping(address => address[]) public _USER_STD_REGISTRY_;
    event AdminChange(address indexed Admin, address indexed newAdmin);
    constructor(address _token,uint256 _fee)  public {
        admin = msg.sender;
        tokenaddress = _token;
        fee = fee;
    }
    
    modifier  _isOwner() {
        require(msg.sender == admin);
        _;
    }
    function changeOwner(address manager) external _isOwner {
        admin = manager;
        emit AdminChange(msg.sender,manager);
    }
    function changefee(address _token,uint256 _fee) external _isOwner {
        tokenaddress = _token;
        fee = fee;
    }
    function creatBasisToken(address manager,uint256 _totalSupply,string memory _name, string memory _symbol,string memory _logo) public returns(address){
        address token = address(new BasisERC20(manager,_totalSupply,_name,_symbol,_logo));
        _USER_STD_REGISTRY_[msg.sender].push(token);
        ERC20(tokenaddress).transfer(admin,fee);
        return token;
    }
    function creatComplexToken(address manager,uint256 _totalSupply,uint256 _mintfee,uint256 _burnfee,uint256 _fee, uint256 _endtime,address[] memory minter,uint256[] memory minterfee,string memory _name, string memory _symbol,string memory _logo) public returns(address){
        address token = address(new ComplexERC20(manager,_totalSupply,_mintfee, _burnfee,_fee,_endtime,minter, minterfee,_name,_symbol,_logo));
        _USER_STD_REGISTRY_[msg.sender].push(token);
        ERC20(tokenaddress).transfer(admin,fee);
        return token;
    }
    
    function getRegistry(address user) public view returns (address[] memory )
    {
        return _USER_STD_REGISTRY_[user];
    }
}



