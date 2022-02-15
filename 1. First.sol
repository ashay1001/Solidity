//SPDX-License-Identifier: MIT
// below line specifies solidity version. we can also specify some specific version ex: 0.6.0
// ex: ^0.6.0 means any version above 0.6.0 upto 0.6.9 i.e below 0.7.0
pragma solidity >=0.6.0 <0.9.0;

// "contract" keyword can be considered as "class" from java/cpp

contract first
{
    uint256 number = 100;   // unsigned int of size 256 bits ex: number = -100 will give error. Default visibility is 'internal'
    bool public check = true;
    string public s = "Hello World";
    address public addr = 0xE22D03279A069496Fedb303C35FDC30A169418eC;
    bytes32 public byteVar = "hello";

}
