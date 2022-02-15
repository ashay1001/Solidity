//SPDX-License-Identifier: MIT

/*
Solidity knows two kinds of function calls: internal ones that do not create an actual EVM call 
(also called a “message call”) and external ones that do. Because of that, there are four types of visibility 
for functions and state variables.

Functions have to be specified as being external, public, internal or private. 
For state variables, external is not possible.

external:
External functions are part of the contract interface, which means they can be called 
from other contracts and via transactions. An external function f cannot be called internally 
(i.e. f() does not work, but this.f() works). External functions are sometimes more efficient when they 
receive large arrays of data, because the data is not copied from calldata to memory.

public:
Public functions are part of the contract interface and can be either called internally or via messages. 
For public state variables, an automatic getter function is generated.

internal:
Those functions and state variables can only be accessed internally 
(i.e. from within the current contract or contracts deriving from it), without using this.


private:
Private functions and state variables are only visible for the contract they are defined in and 
not in derived contracts.

Note: Everything that is inside a contract is visible to all observers external to the blockchain. 
Making something private only prevents other contracts from reading or modifying the information, 
but it will still be visible to the whole world outside of the blockchain.
*/

pragma solidity >=0.6.0 <0.9.0;

contract function_demo{

    uint256 public number;     // this will be initialized to zero

    function store(uint256 num) public
    {
        number = num;
    }

    //Functions can be declared view/pure in which case they promise not to modify the state.
    function retrive() public view returns(uint256)
    {
        return number;
    }

    struct Person
    {
        uint256 id;
        string name;
    }

    //Person public p1 = Person({id: 1, name: "Rahul"});
    //as we have not specified the size of array, this will treated as dynamic array.
    Person[] public p1;

    // string is a special type of byte array which needs to be stored somewhere
    // 'memory' and 'storage' are the two storage types.
    // memory is used for storing during execution only and storage is used for storing permanently
    function addPerson(uint256 _id, string memory _name) public
    {
        p1.push(Person(_id, _name));
    }

    /*
    Mapping in Solidity acts like a hash table or dictionary in any other language. 
    These are used to store the data in the form of key-value pairs, 
    a key can be any of the built-in data types but reference types are not allowed while 
    the value can be of any type. Mappings are mostly used to associate the unique Ethereum address 
    with the associated value type.
    */

    mapping(uint256 => string) public IDtoName;
    
    function mappingDemo(uint256 _id, string memory _name) public
    {
        IDtoName[_id] = _name;
    }
    
}
