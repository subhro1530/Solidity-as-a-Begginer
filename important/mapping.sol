// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;

contract mapping1
{
    struct Student{
        string name;
        uint class;
    }
    
    mapping(uint=> Student) public data;

    function setter(uint _roll,uint _class,string memory _name) public 
    {
        data[_roll]= Student(_name,_class);
    }
}