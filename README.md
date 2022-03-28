
## 1.Project name

ERC20 Factory System

## 2.Elevator pitch

Anyone can issue their own ERC20 tokens through the ERC20 Factory system. Through this system, you can not only issue standard ERC20 tokens, but also issue some ERC20 tokens with special rules.

## 3.Team Name

RainbowCity Foundation

## 4.Submission links


Submission address directory:
http://www.rainbowdao.io/project

Project demo website:
https://erc20.rainbowdao.io/



GitHub repository :
https://github.com/RainbowDAO/08-DAO-ERC20-Factory



Solidity-Version-contract (GitHub):
https://github.com/RainbowDAO/08-DAO-ERC20-Factory/tree/main/Solidity-contract



Frontend code (GitHub):
https://github.com/RainbowDAO/05-ETHDenver2022-DAO-ERC20-Factory/tree/main/Front-end



Picture (GitHub):
https://github.com/RainbowDAO/08-DAO-ERC20-Factory/tree/main/PIC



## 5.Recorded video demo

https://youtu.be/Nt8RLfuNIRw



## 6.Testnet Deployment Information

Network Name: Rinkeby Test Network
RPC URL: https://rinkeby.infura.io/v3/

Contract deployment address

ERC20Factory :
0x6bA328D11E50d2A2862B6032BF91b166d1558425

Frontend docs:
https://github.com/RainbowDAO/08-DAO-ERC20-Factory/blob/main/Front-end/README.md

Contract  docs:
https://github.com/RainbowDAO/08-DAO-ERC20-Factory/blob/main/Solidity-contract/README.md



### 7.Project social media:

RainbowDAO website: http://www.rainbowdao.io

Rainbowcity website: https://www.rainbowcity.io

Twitter:    https://twitter.com/RainbowDAOio

Discord:     https://discord.gg/vbnvFEeYRr

Telegram: https://t.me/RainbowDAO

Medium:   https://medium.com/rainbowcity

Github:    https://github.com/RainbowDAO

Email: Rainbowcitydao@gmail.com



#  Project Story



## 1.Inspiration

ERC20 Factory is the most basic tool for token issuance, the most frequently used tool by any DAO organization, and a requirement in the AURORA Sponsor Challenge.

At present, many platforms in the Eth ecosystem have also built ERC20-Factory products, but most of the current products only have very simple and basic functions and cannot handle some complex needs, such as the issuance and destruction of ERC20 tokens.

There is another situation. The governance module of Compound tokens has become an industry standard, especially the voting delegation function. But many ERC20 tokens on the market do not have this function. This is some of the information we are currently considering when conceiving this product.

## 2.What it does

Based on the above inspirations, combined with the requirements of the AURORA Sponsor Challenge, we have specially developed this ERC20-Factory system. In addition to meeting some of the most basic ERC20 token issuance functions, we have also developed some special functions to meet the needs of various The diverse needs of various types of DAO organizations in issuing tokens.

⑴For the function of additional issuance and destruction of ERC20 tokens, we have set up the additional issuance settings of tokens under different conditions.

⑵Administrator function of ERC20 token.

⑶ The function of whether to pay transaction fees when transferring ERC20 tokens.

These specialized functions are suitable for different situations, and everyone who uses this tool can flexibly match them according to their actual needs.

## 3.How we built it

![image](https://raw.githubusercontent.com/RainbowDAO/08-DAO-ERC20-Factory/main/PIC/logic-diagram.png)



⑴Initialization information:
ERC20 token name, symbol, circulation, accuracy, logo (transmitted to the decentralized storage, an administrator can change the logo address, and the logo information cannot be changed without an administrator).

⑵Whether to support administrators:
If it is not supported, the administrator will not set the protocol administrator.

The support administrator has the following three functions:

①The default protocol creator is the protocol administrator;
②You can designate another wallet address as the protocol administrator;
③The protocol has the function of administrator transfer, which can transfer the administrator to other wallet addresses.

⑶ Whether to support additional issuance
If the protocol does not have an administrator, it does not have the function of additional issuance;

If you choose to support the additional issuance function, there are two situations:

① Permanent additional issuance: A fixed percentage can be issued every year, the annual percentage of additional issuance can be set according to the initial total supply, and there is no limit to the number of years for the specific additional issuance.

② Conditional additional issuance: The following four different situations can be initialized:

A. How many additional years can be issued, and what percentage can be issued each year;

B. How many additional years can be issued, what percentage of additional issuance can be issued in the first year, and the percentage of additional issuance in each subsequent year will be halved.

C. How many additional years can be issued, and the proportion of additional issuance in the first year, and the proportion of additional issuance in each subsequent year will be reduced by 20% in the previous year.

D. How many additional years can be issued, what percentage of additional issuance in the first year, and 20% increase in the proportion of additional issuance in each subsequent year in the previous year.

⑷ Protocol whether to support the burning function
The burning function means that every time an ERC20 token is transferred, a specified proportion of the tokens can be put into the black hole address for destruction, thereby reducing the market circulation of the tokens.

There can be two situations in the agreement:

The first one does not support burning, so no setting is required;

The second is to support burning: if the protocol has no administrator, it is a fixed burning ratio, which cannot be changed. If the protocol has administrators, this burn ratio can be changed by governance.

⑸ Whether to support transaction fees
Whether or not to support transaction fees means that each time an ERC20 token is transferred, a specified proportion of tokens can be transferred to a specified address as a transaction fee for token circulation, which is equivalent to the token circulation fee captured by the creator of the token .

The first case does not support transaction fees, so no setting is required;

The second case supports transaction fees, there are the following three cases:

①  The transaction fee is sent to the creator's address;
②  The transaction fee is sent to the specified address, there can be multiple addresses, and the proportion of each address can be set;
③  There is no administrator for the fixed transaction ratio, and there are administrators who can change the transaction fee ratio.

⑹Token distribution address
The setting of the token distribution address refers to the addresses to which the ERC20 token is distributed after the creation of the ERC20 token, which is also divided into two different situations:

①  All ERC20 tokens are sent to the creator's wallet address;
②  ERC20 tokens will be sent to the designated wallet address proportionally.

These can be set according to the situation of different people.



#  Project UI

##  1-Token-Information

![image](https://raw.githubusercontent.com/RainbowDAO/08-DAO-ERC20-Factory/main/PIC/1-Token-Information.png)


##  2-Manager-1


![image](https://raw.githubusercontent.com/RainbowDAO/08-DAO-ERC20-Factory/main/PIC/2-Manager-1.png)


##  3-Manager-2


![image](https://raw.githubusercontent.com/RainbowDAO/08-DAO-ERC20-Factory/main/PIC/3-Manager-2.png)


##  4-Manager-3


![image](https://raw.githubusercontent.com/RainbowDAO/08-DAO-ERC20-Factory/main/PIC/4-Manager-3.png)


##  5-Burning


![image](https://raw.githubusercontent.com/RainbowDAO/08-DAO-ERC20-Factory/main/PIC/5-Burning.png)


##  6-Trading-Fees-1


![image](https://raw.githubusercontent.com/RainbowDAO/08-DAO-ERC20-Factory/main/PIC/6-Trading-Fees-1.png)


##  7-Trading-Fees-2


![image](https://raw.githubusercontent.com/RainbowDAO/08-DAO-ERC20-Factory/main/PIC/7-Trading-Fees-2.png)


##  8-Token-distribution-address-1


![image](https://raw.githubusercontent.com/RainbowDAO/08-DAO-ERC20-Factory/main/PIC/8-Token-distribution-address-1.png)


##  9-Token-distribution-address-2


![image](https://raw.githubusercontent.com/RainbowDAO/08-DAO-ERC20-Factory/main/PIC/9-Token-distribution-address-2.png)


##  10-Token-List-1


![image](https://raw.githubusercontent.com/RainbowDAO/08-DAO-ERC20-Factory/main/PIC/10-Token-List-1.png)


##  11-Token-List-2


![image](https://raw.githubusercontent.com/RainbowDAO/08-DAO-ERC20-Factory/main/PIC/11-Token-List-2.png)


##  12-Manage-Setting-1


![image](https://raw.githubusercontent.com/RainbowDAO/08-DAO-ERC20-Factory/main/PIC/12-Manage-Setting-1.png)


##  13-Manage-Setting-2


![image](https://raw.githubusercontent.com/RainbowDAO/08-DAO-ERC20-Factory/main/PIC/13-Manage-Setting-2.png)


##  14-Manage-Setting-3


![image](https://raw.githubusercontent.com/RainbowDAO/08-DAO-ERC20-Factory/main/PIC/14-Manage-Setting-3.png)
