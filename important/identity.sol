// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
 /**
   * @title ContractName
   * @dev ContractDescription
   * @custom:dev-run-script identity.sol
   */


contract Identity{
    string name;
    uint age;

    constructor()  
    {
        name="Ravi";
        age=17;
    }

    function getName() view public returns (string memory)
    {
        return name;
    }

    function getAge() view public returns (uint)
    {
        return age;
    }

    function setAge() public 
    {
        age=age+1;
    }
}