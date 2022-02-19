// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

//this is nothing but copy pasting SimpleStorage.sol into this file. './' represents the same directory
import "./SimpleStorage.sol"; 

//'is SimpleStorage' signifies that StorageFactory is of the type SimpleStorage i.e we can consider it has inheritance.
//Now StorageFactory will have all the functions and variable from SimplStorage
contract StorageFactory is SimpleStorage {
    
    SimpleStorage[] public simpleStorageArray;
    
    //function to create new SimpleStoage contract and store its address into list
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);     //address of this new contract will be stored in the list
    }
    
    //function to get desired indexed contract from 'simpleStorageArray' list and then store the given number using 'store' method of that contract 
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address and ABI are required to interact with any contract 
        //this line has an explicit cast to the address type and initializes a new SimpleStorage object from the address
        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber); 

        //this line simply gets the SimpleStorage object at the index _simpleStorageIndex in the array simpleStorageArray
        //simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }
    
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        //this line has an explicit cast to the address type and initializes a new SimpleStorage object from the address 
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve(); 

        //this line simply gets the SimpleStorage object at the index _simpleStorageIndex in the array simpleStorageArray
        //return simpleStorageArray[_simpleStorageIndex].retrieve(); 
    }

}