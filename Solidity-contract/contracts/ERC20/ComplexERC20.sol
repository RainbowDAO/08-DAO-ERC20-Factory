// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../../node_modules/@openzeppelin/contracts/utils/Address.sol";
import "../../node_modules/@openzeppelin/contracts/utils/math/SafeMath.sol";



contract ComplexERC20 is ERC20{
    using SafeMath for uint256;
    
    address public admin;
    
    address[] public feeto;
    
    string public logo;
    uint256 public fee;
    uint256 public burnfee;
    uint256 public starttime;
    uint256 public endtime;
    uint256 public mintflag;
    bool public burnflag = true;
    bool public feeflag = true;
    uint256 public typeofmint;
    uint256 public firsttotalSupply;
    struct Checkpoint {
        uint32 fromBlock;
        uint96 votes;
    }
    mapping (address => mapping (uint32 => Checkpoint)) public checkpoints;
    mapping (address => uint32) public numCheckpoints;
    mapping (uint32 => uint256) public mintamounts;
    mapping (uint32 => uint256) public mintamountsSupply;
    
    event DelegateVotesChanged(address indexed delegate, uint256 previousBalance, uint256 newBalance);
    event AdminChange(address indexed Admin, address indexed newAdmin);
    constructor(address manager,uint256 _totalSupply,uint256 _mintfee,uint256 _burnfee,uint256 _fee,uint256 _endtime,
    address[] memory minter,uint256[] memory minterfee,
    string memory _name, string memory _symbol,string memory _logo)  public ERC20(_name, _symbol){
        admin = manager;
        feeto.push(manager);
        logo = _logo;
        mintflag = _mintfee;
        firsttotalSupply = _totalSupply;
        if (_burnfee == 10001){
            burnfee = 0;
            burnflag = false;
        }else  {
            burnfee = _burnfee;
        }
        if (_fee == 10001){
            fee = 0;
            feeflag = false;
        }else  {
            fee = _fee;
        }
        starttime = block.timestamp;
        endtime = starttime + _endtime;
        for (uint8 i; i < minter.length; i++){
            uint256 mintamount = _totalSupply.mul(minterfee[i]).div(10000);
            _mint(minter[i], mintamount * 10 ** 18);
            _addDelegates(minter[i], safe96(mintamount * 10 ** 18,"erc20: vote amount underflows"));
        }
    }
    
    modifier  _isOwner() {
        require(msg.sender == admin);
        _;
    }
    
    function changeOwner(address manager) external _isOwner {
        admin = manager;
        emit AdminChange(msg.sender,manager);
    }
    
    function modifyFee(uint value) external _isOwner {
        require (feeflag);
        fee = value;
    }
    function modifyBurnFee(uint value) external _isOwner {
        require (burnflag);
        burnfee = value;
    }
    
    function changeFeeTo(address[]  memory guager) external _isOwner {
        require (feeflag);
        feeto = guager;
    }
    
    function mint( uint256 amount,address[] memory minter,uint256[] memory minterfee) external _isOwner{
        uint32 year = safe32(block.timestamp.sub(starttime).div(31536000),"time: Time error");
        
        if (mintflag == 0){
            
        }else if (mintflag > 0 && mintflag <10000 ){
            uint256 mintamount = firsttotalSupply.mul(mintflag).div(10000);
            uint256 residue = mintamounts[year];
            require(mintamount > amount.add(residue));
            mintamountsSupply[year] =mintamount; 
            for (uint8 i; i < minter.length; i++){
                uint256 mintamounttemp = mintamount.mul(minterfee[i]).div(10000);
                _mint(minter[i], mintamounttemp );
                _addDelegates(minter[i], safe96(mintamounttemp,"vote: vote amount underflows"));
            }
            mintamounts[year] = mintamounts[year].add(amount);
        } else if (mintflag > 10000 && mintflag <20000 ){
            require(block.timestamp < endtime);
            uint256 mintfee = mintflag.sub(10000);
            uint256 mintamount = firsttotalSupply.mul(mintfee).div(10000);
            uint256 residue = mintamounts[year];
            require(mintamount > amount.add(residue));
            mintamountsSupply[year] =mintamount;
            for (uint8 i; i < minter.length; i++){
                uint256 mintamounttemp = mintamount.mul(minterfee[i]).div(10000);
                _mint(minter[i], mintamounttemp );
                _addDelegates(minter[i], safe96(mintamounttemp,"vote: vote amount underflows"));
            }
            mintamounts[year] = mintamounts[year].add(amount);
        } else if (mintflag >20000 && mintflag <30000 ){
            require(block.timestamp < endtime);
            uint256 mintfee = mintflag.sub(20000).mul(5**year).div(10**year);
            uint256 mintamount = firsttotalSupply.mul(mintfee).div(10000);
            uint256 residue = mintamounts[year];
            require(mintamount > amount.add(residue));
            mintamountsSupply[year] =mintamount;
            for (uint8 i; i < minter.length; i++){
                uint256 mintamounttemp = mintamount.mul(minterfee[i]).div(10000);
                _mint(minter[i], mintamounttemp );
                _addDelegates(minter[i], safe96(mintamounttemp,"vote: vote amount underflows"));
            }
            mintamounts[year] = mintamounts[year].add(amount);
        } else if (mintflag > 30000 && mintflag <40000 ){
          require(block.timestamp < endtime);
            uint256 mintfee = mintflag.sub(30000).mul(8**year).div(10**year);
            uint256 mintamount = firsttotalSupply.mul(mintfee).div(10000);
            uint256 residue = mintamounts[year];
            require(mintamount > amount.add(residue));
            mintamountsSupply[year] =mintamount;
            for (uint8 i; i < minter.length; i++){
                uint256 mintamounttemp = mintamount.mul(minterfee[i]).div(10000);
                _mint(minter[i], mintamounttemp );
                _addDelegates(minter[i], safe96(mintamounttemp,"vote: vote amount underflows"));
            }
            mintamounts[year] = mintamounts[year].add(amount);
        } else if (mintflag > 40000 && mintflag <50000 ){
          require(block.timestamp < endtime);
            uint256 mintfee = mintflag.sub(40000).mul(12**year).div(10**year);
            uint256 mintamount = firsttotalSupply.mul(mintfee).div(10000);
            uint256 residue = mintamounts[year];
            require(mintamount > amount.add(residue));
            mintamountsSupply[year] =mintamount;
            for (uint8 i; i < minter.length; i++){
                uint256 mintamounttemp = mintamount.mul(minterfee[i]).div(10000);
                _mint(minter[i], mintamounttemp );
                _addDelegates(minter[i], safe96(mintamounttemp,"vote: vote amount underflows"));
            }
            mintamounts[year] = mintamounts[year].add(amount);
        } 
    }
  
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
       
       
        _transferErc20(msg.sender,recipient,amount);
        return true;
        
    }
    
    function getMintamount(address user) public view returns (uint256 )
    {
        uint32 year = safe32(block.timestamp.sub(starttime).div(31536000),"time: Time error");
        return mintamounts[year];
    }
   function getMintamountsSupply(address user) public view returns (uint256 )
    {
        uint32 year = safe32(block.timestamp.sub(starttime).div(31536000),"time: Time error");
        return mintamountsSupply[year];
    }
    function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        
        _transferErc20(sender,recipient,amount);
        uint256 currentAllowance = allowance(sender,_msgSender());
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        _approve(sender, _msgSender(), currentAllowance-amount);
        return true;
    }
   
    function getCurrentVotes(address account) external view returns (uint96) {
        uint32 nCheckpoints = numCheckpoints[account];
        return nCheckpoints > 0 ? checkpoints[account][nCheckpoints - 1].votes : 0;
    }
    
    function getPriorVotes(address account, uint blockNumber) public view returns (uint96) {
         require(blockNumber <= block.number, "ERC20: not yet determined");
    
         uint32 nCheckpoints = numCheckpoints[account];
         if (nCheckpoints == 0 || checkpoints[account][0].fromBlock > blockNumber) {
             return 0;
         }
         
         if (checkpoints[account][nCheckpoints - 1].fromBlock <= blockNumber) {
             return checkpoints[account][nCheckpoints - 1].votes;
         }
    
         uint32 lower = 0;
         uint32 upper = nCheckpoints - 1;
         while (upper > lower) {
             uint32 center = upper - (upper - lower) / 2; 
             Checkpoint memory cp = checkpoints[account][center];
             if (cp.fromBlock == blockNumber) {
                 return cp.votes;
             } else if (cp.fromBlock < blockNumber) {
                 lower = center;
             } else {
                 upper = center - 1;
             }
        }
        return checkpoints[account][lower].votes;
     }
   
    function _transferErc20(address sender, address recipient, uint256 amount) internal {
          
        uint96 amount96 = safe96(amount,"vote: vote amount underflows");
        
            uint256 aa = 10000;
            if(burnfee > 0){
                uint256 amountburn2 = amount.mul(burnfee).div(aa);
                _burn(sender,amount);
            }
            uint256 amountburn1 = amount.mul(aa.sub(burnfee)).div(aa);
            uint256 amount1 = amountburn1.mul(aa.sub(fee)).div(aa);
            _transfer(sender, recipient, amount1);
            uint96 vote96 = safe96(amount1,"vote: vote amount underflows");
            _addDelegates(recipient, vote96);
            if (fee > 0){
                uint256 amount2 = amountburn1.mul(fee).div(aa);
                for (uint8 i; i < feeto.length; i++){
                  _transfer(sender, feeto[i], amount2);
                }
               
                uint96 fee96 = safe96(amount2,"vote: vote amount underflows");
               
                for (uint8 i; i < feeto.length; i++){
                  _addDelegates(feeto[i], fee96);
                }
            }
            
        
        
        _devDelegates(sender, amount96);
    }
  
    function _addDelegates(address dstRep, uint96 amount) internal {
          
        uint32 dstRepNum = numCheckpoints[dstRep];
        uint96 dstRepOld = dstRepNum > 0 ? checkpoints[dstRep][dstRepNum - 1].votes : 0;
        uint96 dstRepNew = add96(dstRepOld, amount, "vote: vote amount overflows");
        _writeCheckpoint(dstRep, dstRepNum, dstRepOld, dstRepNew);
        
    }
   
    function _devDelegates(address srcRep,  uint96 amount) internal {
          
        uint32 srcRepNum = numCheckpoints[srcRep];
        uint96 srcRepOld = srcRepNum > 0 ? checkpoints[srcRep][srcRepNum - 1].votes : 0;
        uint96 srcRepNew = sub96(srcRepOld, amount, "vote: vote amount underflows");
        _writeCheckpoint(srcRep, srcRepNum, srcRepOld, srcRepNew);
    }
    
    function _writeCheckpoint(address delegatee, uint32 nCheckpoints, uint96 oldVotes, uint96 newVotes) internal {
        uint32 blockNumber = safe32(block.number, "erc: block number exceeds 32 bits");
    
        if (nCheckpoints > 0 && checkpoints[delegatee][nCheckpoints - 1].fromBlock == blockNumber) {
            checkpoints[delegatee][nCheckpoints - 1].votes = newVotes;
        } else {
            checkpoints[delegatee][nCheckpoints] = Checkpoint(blockNumber, newVotes);
            numCheckpoints[delegatee] = nCheckpoints + 1;
        }
    
        emit DelegateVotesChanged(delegatee, oldVotes, newVotes);
    }
    function safe32(uint n, string memory errorMessage) internal pure returns (uint32) {
        require(n < 2**32, errorMessage);
        return uint32(n);
    }
    
    function safe96(uint256 n, string memory errorMessage) internal pure returns (uint96) {
        require(n < 2**96, errorMessage);
        return uint96(n);
    }
    
    function add96(uint96 a, uint96 b, string memory errorMessage) internal pure returns (uint96) {
        uint96 c = a + b;
        require(c >= a, errorMessage);
        return c;
    }

    function sub96(uint96 a, uint96 b, string memory errorMessage) internal pure returns (uint96) {
        require(b <= a, errorMessage);
        return a - b;
    }
}
